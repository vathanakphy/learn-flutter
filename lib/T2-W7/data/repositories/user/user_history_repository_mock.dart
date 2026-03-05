import 'package:basic/T2-W7/data/repositories/user/user_history_repository.dart';
import 'package:basic/T2-W7/model/songs/song.dart';

class UserHistoyMockRepository extends UserHistoyRepository {
  final Set<Song> _history = {};

  @override
  List<Song> fetchSongsHistory() => _history.toList();

  @override
  Song? fetchSongById(String id) =>
      _history.where((element) => element.id == id).first;

  @override
  void addToHistory(Song song) {
    _history.add(song);
  }
}
