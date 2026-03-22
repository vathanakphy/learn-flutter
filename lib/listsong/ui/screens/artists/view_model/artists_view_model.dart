import 'package:basic/listsong/data/repositories/artists/artists_repository.dart';
import 'package:basic/listsong/model/artists/artists.dart';
import 'package:basic/listsong/ui/utils/async_value.dart';
import 'package:flutter/material.dart';


class ArtistsViewModel extends ChangeNotifier {
  final ArtistsRepository  artistsRepository;

  AsyncValue<List<Artists>> artistsValue = AsyncValue.loading();

  ArtistsViewModel({required this.artistsRepository}) {
    // init
    _init();
  }

  void _init() async {
    fetchArtists();
  }

  void fetchArtists() async {
    // 1- Loading state
    artistsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successfull
      List<Artists> artists = await artistsRepository.fetchArtists();
      artistsValue = AsyncValue.success(artists);
    } catch (e) {
      // 3- Fetch is unsucessfull
      artistsValue = AsyncValue.error(e);
    }
    notifyListeners();

  }
}
