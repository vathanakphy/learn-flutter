import 'package:basic/t2-w8/ui/utils/async_value.dart';
import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;
  late AsyncValue<List<Song>> _songs;
  LibraryViewModel({required this.songRepository, required this.playerState}) {
    playerState.addListener(notifyListeners);
    // init
    _init();
  }

  AsyncValue<List<Song>> get song => _songs;

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }

  void _init() async {
    // 1 - Fetch songs
    _songs = AsyncValue.loading();
    notifyListeners();
    try {
      List<Song> songs = await songRepository.fetchSongs();
      _songs = AsyncValue.success(songs);
    } catch (e) {
      _songs = AsyncValue.error(e);
    }
    // 2 - notify listeners
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
