import 'package:basic/listsong/model/artists/artists.dart';
import 'package:flutter/material.dart';

class ArtistTile extends StatelessWidget {
  const ArtistTile({
    super.key,
    required this.artists,
  });

  final Artists artists;

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
            foregroundImage: NetworkImage(artists.imageUrl.toString()),
          ),
          title: Text(artists.name),
          subtitle: Text(artists.genre),
        ),
      ),
    );
  }
}
