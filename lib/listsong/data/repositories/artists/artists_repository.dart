import '../../../model/artists/artists.dart';

abstract class ArtistsRepository {
  Future<List<Artists>> fetchArtists();

  Future<Artists?> fetchArtistById(String id);
}
