import 'package:basic/listsong/model/artists/artists.dart';
import 'package:flutter/material.dart';

import '../../../model/songs/song.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
    required this.songArtist,
    required this.onLike,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onLike;
  final Artists? songArtist;

  get renderSubtitle =>
      "${song.duration.inMinutes} mins ${songArtist?.name ?? 'Unknown'}- ${songArtist?.genre ?? 'Unknown'} - total likes${song.totalLike}";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: CircleAvatar(
            foregroundImage: NetworkImage(song.imageUrl.toString()),
          ),
          onTap: onTap,
          title: Text(song.title),
          subtitle: Text(renderSubtitle),
          trailing: Wrap(
            spacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                isPlaying ? "Playing" : "",
                style: TextStyle(color: Colors.amber),
              ),
              IconButton(onPressed: onLike, icon: Icon(Icons.heart_broken)),
            ],
          ),
        ),
      ),
    );
  }
}
