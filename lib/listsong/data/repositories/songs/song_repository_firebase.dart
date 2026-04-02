import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  static final Uri baseUri = Uri.https(
    'mobile-g3-default-rtdb.asia-southeast1.firebasedatabase.app',
  );
  static Uri songsUri = baseUri.replace(path: '/songs.json');
  List<Song>? _cachedSongs;

  @override
  Future<List<Song>> fetchSongs({bool forceFetch = false}) async {
    if (!forceFetch && _cachedSongs != null) {
      print("hit cache");
      return _cachedSongs!;
    }

    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> bodyJson = json.decode(response.body);
      _cachedSongs = bodyJson.entries
          .map((e) => SongDto.fromJson(e.key, e.value))
          .toList();
      return _cachedSongs!;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id, {bool forceFetch = false}) async {
    // 1. Return cache if available and not forcing fetch
    if (!forceFetch && _cachedSongs != null) {
      try {
        return _cachedSongs!.firstWhere((song) => song.id == id);
      } catch (e) {
        // Not found, continue fetching if needed
      }
    }
    return null;
  }

  @override
  Future<Song?> likeSong(Song song) async {
    final songWithIDUri = baseUri.replace(path: '/songs/${song.id}.json');
    final Map<String, int> payload = {"likes": song.totalLike + 1};

    final http.Response response = await http.patch(
      songWithIDUri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> bodyJson = json.decode(response.body);
      // Return updated song
      return Song(
        id: song.id,
        title: song.title,
        artistId: song.artistId,
        imageUrl: song.imageUrl,
        totalLike: bodyJson['likes'] ?? song.totalLike,
        duration: song.duration,
      );
    } else {
      throw Exception('Failed to like song: ${response.statusCode}');
    }
  }
}
