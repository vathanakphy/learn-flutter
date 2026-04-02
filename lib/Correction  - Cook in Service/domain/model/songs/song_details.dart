import '../artist/artist.dart';
import 'song.dart';

class SongDetails {
  final Song song;
  final Artist artist;

  SongDetails({required this.song, required this.artist});

  SongDetails withSong(Song newSong) => SongDetails(song: newSong, artist: artist);
}
