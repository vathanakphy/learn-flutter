import 'package:basic/listsong/data/repositories/artists/artists_repository.dart';
import 'package:basic/listsong/ui/screens/artists/widgets/artists_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/artists_view_model.dart';

class  ArtistsScreen extends StatelessWidget {
  const  ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>  ArtistsViewModel(
        artistsRepository: context.read<ArtistsRepository>(),
      ),
      child:  ArtistsContent(),
    );
  }
}
