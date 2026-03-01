import 'package:basic/spotify/ui/states/player_state.dart';
import 'package:basic/spotify/ui/states/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../../model/songs/song.dart';
import '../../theme/theme.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the global song repository
    SongRepository songRepository = context.read<SongRepository>();
    PlayerState playerState = context.read<PlayerState>();
    List<Song> songs = songRepository.fetchSongs();
    final AppSettingsState settingsState = context.watch<AppSettingsState>();

    bool isPlaying(Song song) {
      return playerState.currentSong == song;
    }

    void togleSong(Song song) {
      if (isPlaying(song)) {
        playerState.stop();
      } else {
        playerState.play(song);
      }
    }

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => ListenableBuilder(
                listenable: playerState,
                builder: (context, child) => SongTile(
                  song: songs[index],
                  isPlaying: isPlaying(songs[index]),
                  onTap: () {
                    togleSong(songs[index]);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
          SizedBox(width: 10),
          Icon(isPlaying ? Icons.pause : Icons.play_arrow),
        ],
      ),
    );
  }
}
