import 'dart:convert';

import 'package:basic/listsong/data/config.dart';
import 'package:basic/listsong/data/dtos/artists_dto.dart';
import 'package:basic/listsong/data/repositories/artists/artists_repository.dart';
import 'package:basic/listsong/model/artists/artists.dart';
import 'package:http/http.dart' as http;

class ArtistsRepositoryFirebase extends ArtistsRepository {
  static Uri artistsUri = baseUri.replace(path: '/artists.json');
  List<Artists>? _cachedArtists;

  @override
  Future<List<Artists>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);
    if(_cachedArtists != null) {
      return _cachedArtists!;
    }
    if (response.statusCode == 200) {
      Map<String, dynamic> bodyJson = json.decode(response.body);
      _cachedArtists = bodyJson.entries
          .map((e) => ArtistsDto.fromJson(e.key, e.value))
          .toList();
      return _cachedArtists!;
    } else {
      throw Exception('Failed to load artists');
    }
  }

  @override
  Future<Artists?> fetchArtistById(String id, {bool forceFetch = false}) async {
    if (!forceFetch && _cachedArtists != null) {
      return _cachedArtists!.firstWhere((artist) => artist.id == id, orElse: () => throw Exception('Artist not found'));
    }
    final http.Response response = await http.get(artistsUri.replace(path: '/artists/$id.json'));
    if (response.statusCode == 200) {
      Map<String, dynamic> bodyJson = json.decode(response.body);
      return ArtistsDto.fromJson(id, bodyJson);
    } else {
      throw Exception('Failed to load artist');
    }
  }
}
