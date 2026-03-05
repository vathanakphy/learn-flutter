import 'package:basic/T2-W7/data/repositories/user/user_history_repository.dart';
import 'package:basic/T2-W7/ui/screens/home_screen/view_model/home_view_model.dart';
import 'package:basic/T2-W7/ui/screens/home_screen/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    SongRepository songRepository = context.read<SongRepository>();
    UserHistoyRepository userHistoyRepository = context.read<UserHistoyRepository>();
    // 3 - Watch the globbal player state
    PlayerState playerState = context.watch<PlayerState>();
    return ListenableProvider(
      create: (context) => HomeViewModel(
        songRepository: songRepository,
        playerState: playerState,
        userHistoyRepository: userHistoyRepository
      ),
      child: const HomeContent(),
    );
  }
}
