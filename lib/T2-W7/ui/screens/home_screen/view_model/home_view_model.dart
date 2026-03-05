import 'package:basic/T2-W7/data/repositories/songs/song_repository.dart';
import 'package:basic/T2-W7/data/repositories/user/user_history_repository.dart';
import 'package:basic/T2-W7/model/songs/song.dart';
import 'package:basic/T2-W7/ui/states/player_state.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final UserHistoyRepository userHistoyRepository;
  final PlayerState playerState;
  List<Song> _songs = [];

  List<Song> get history => userHistoyRepository.fetchSongsHistory();
  List<Song> get songs => _songs.where((e) => !history.contains(e)).toList();

  bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }

  HomeViewModel({
    required this.songRepository,
    required this.playerState,
    required this.userHistoyRepository,
  }) {
    init();
  }

  void init() {
    _songs = songRepository.fetchSongs();
    playerState.addListener(() {
      notifyListeners();
    });
  }

  void togleSong(Song song) {
    if (playerState.currentSong == song) {
      playerState.stop();
    } else {
      userHistoyRepository.addToHistory(song);
      playerState.start(song);
    }
  }
}
