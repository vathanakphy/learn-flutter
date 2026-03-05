import 'package:basic/T2-W7/model/songs/song.dart';
import 'package:basic/T2-W7/ui/screens/home_screen/view_model/home_view_model.dart';
import 'package:basic/T2-W7/ui/screens/library/widgets/song_tile.dart';
import 'package:basic/T2-W7/ui/theme/theme.dart';
import 'package:basic/T2-W7/ui/states/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    AppSettingsState appSettingsState = context.watch<AppSettingsState>();
    return Container(
      color: appSettingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),
          SizedBox(height: 50),
          Text("Your recent songs", style: AppTextStyles.label),
          Expanded(
            child: ListView.builder(
              itemCount: homeViewModel.history.length,
              itemBuilder: (context, index) {
                Song cur = homeViewModel.history[index];
                return SongTile(
                  song: cur,
                  isPlaying: homeViewModel.isPlaying(cur),
                  onTap: () {
                    homeViewModel.togleSong(cur);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 50),
          Text("You might also like", style: AppTextStyles.label),
          SizedBox(height: 50),
          Expanded(
            child: ListView.builder(
              itemCount: homeViewModel.songs.length,
              itemBuilder: (context, index) {
                Song cur = homeViewModel.songs[index];
                return SongTile(
                  song: cur,
                  isPlaying: homeViewModel.isPlaying(cur),
                  onTap: () {
                    homeViewModel.togleSong(cur);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
