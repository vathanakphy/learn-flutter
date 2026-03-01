import 'package:basic/spotify/model/songs/song.dart';
import 'package:flutter/widgets.dart';

class PlayerState extends ChangeNotifier {
  Song? _currentSong;
  Song? get currentSong => _currentSong;
  void play(Song song) {
    _currentSong = song;
    notifyListeners();
  }

  void stop() {
    _currentSong = null;
    notifyListeners();
  }
}
