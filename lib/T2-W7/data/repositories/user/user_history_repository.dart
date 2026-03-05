import 'package:basic/T2-W7/model/songs/song.dart';

abstract class UserHistoyRepository {
  List<Song> fetchSongsHistory();
  Song? fetchSongById(String id);
  void addToHistory(Song song);
}
