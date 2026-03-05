import 'package:basic/T2-W7/model/songs/song.dart';
import 'package:basic/T2-W7/ui/screens/library/view_model/library_view_model.dart';
import 'package:basic/T2-W7/ui/screens/library/widgets/song_tile.dart';
import 'package:basic/T2-W7/ui/theme/theme.dart';
import 'package:basic/T2-W7/ui/states/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});
  @override
  Widget build(BuildContext context) {
    LibraryViewModel libraryViewModel = context.watch<LibraryViewModel>();
    AppSettingsState appSettingsState = context.watch<AppSettingsState>();
    return Container(
      color: appSettingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: libraryViewModel.songs.length,
              itemBuilder: (context, index) {
                Song cur = libraryViewModel.songs[index];
                return SongTile(
                  song: cur,
                  isPlaying: libraryViewModel.isPlaying(cur),
                  onTap: () {
                    libraryViewModel.togleSong(cur);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
