import 'package:basic/T2-W7/data/repositories/songs/song_repository.dart';
import 'package:basic/T2-W7/model/songs/song.dart';
import 'package:basic/T2-W7/ui/states/player_state.dart';
import 'package:flutter/material.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  PlayerState playerState;
  List<Song> _songs = [];
  List<Song> get songs => _songs;

  bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }

  LibraryViewModel({required this.songRepository, required this.playerState}) {
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
      playerState.start(song);
    }
  }
}
