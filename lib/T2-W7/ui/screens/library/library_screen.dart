import 'package:basic/T2-W7/ui/screens/library/view_model/library_view_model.dart';
import 'package:basic/T2-W7/ui/screens/library/widgets/library_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    SongRepository songRepository = context.read<SongRepository>();
    // 3 - Watch the globbal player state
    PlayerState playerState = context.watch<PlayerState>();
    return ListenableProvider(
      create: (context) => LibraryViewModel(
        songRepository: songRepository,
        playerState: playerState,
      ),
      child: const LibraryContent(),
    );
  }
}
