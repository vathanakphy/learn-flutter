import 'package:basic/listsong/data/repositories/artists/artists_repository.dart';
import 'package:basic/listsong/model/artists/artists.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';
import '../../../utils/async_value.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  final ArtistsRepository artistsRepository;

  AsyncValue<List<Song>> songsValue = AsyncValue.loading();
  AsyncValue<Map<String, Artists>> artistsValue = AsyncValue.loading();
  LibraryViewModel({
    required this.songRepository,
    required this.playerState,
    required this.artistsRepository,
  }) {
    playerState.addListener(notifyListeners);
    // init
    _init();
  }

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    await fetchSong();
  }

  Future<void> fetchSong({bool forceFetch = false}) async {
    // 1- Loading state
    songsValue = AsyncValue.loading();
    artistsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Song> songs = await songRepository.fetchSongs(
        forceFetch: forceFetch,
      );
      Map<String, Artists> artistsMap = {};
      songsValue = AsyncValue.success(songs);

      for (var song in songs) {
        Artists? songArtist = await artistsRepository.fetchArtistById(
          song.artistId,
          forceFetch: forceFetch,
        );
        if (songArtist != null) {
          artistsMap[song.artistId] = songArtist;
        }
      }
      artistsValue = AsyncValue.success(artistsMap);
    } catch (e) {
      // 3- Fetch is unsucessfull
      songsValue = AsyncValue.error(e);
      artistsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  Artists? songArtist(Song song) => artistsValue.data?[song.artistId];

  bool isSongPlaying(Song song) => playerState.currentSong == song;
  Future<void> onLike(Song song) async {
    try {
      final updatedSong = await songRepository.likeSong(song);
      if (updatedSong == null) return;
      final currentSongs = songsValue.data;
      if (currentSongs == null) return;

      final updatedList = currentSongs.map((s) {
        if (s.id == song.id) {
          return updatedSong;
        }
        return s;
      }).toList();

      songsValue = AsyncValue.success(updatedList);
    } catch (e) {
      songsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();

  Future<void> refresh() async {
    await fetchSong(forceFetch: true);
  }
}
