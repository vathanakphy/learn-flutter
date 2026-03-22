import 'package:basic/listsong/model/artists/artists.dart';

class ArtistsDto {
  static const String nameKey = 'name';
  static const String genreKey = 'genre';
  static const String imageUrlKey = 'imageUrl';

  static Artists fromJson(String idKey, Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[genreKey] is String);
    assert(json[imageUrlKey] is String);

    return Artists(
      id: idKey,
      name: json[nameKey],
      genre: json[genreKey],
      imageUrl: Uri.parse(json[imageUrlKey]),
    );
  }

  /// Convert Artists to JSON
  Map<String, dynamic> toJson(Artists artist) {
    return {
      nameKey: artist.name,
      genreKey: artist.genre,
      imageUrlKey: artist.imageUrl.toString(),
    };
  }
}
