import 'package:basic/W8-Lab/EXERCISE-4/jokes.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

class Exercise4Week8 {
  static void main() {
    loadJokes();
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: JokeList(jokes: loadJokes()),
      ),
    );
  }
}

class JokeList extends StatefulWidget {
  final List<Joke> jokes;

  const JokeList({super.key, required this.jokes});

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  int favouriteIndex = -1;
  void onCardClicked(int index) {
    setState(() {
      if (favouriteIndex == index) {
        favouriteIndex = -1;
      } else {
        favouriteIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.jokes.length,
      itemBuilder: (context, index) => FavoriteCard(
        title: widget.jokes[index].title,
        description: widget.jokes[index].description,
        isFavorite: favouriteIndex == index,
        onFavoriteClick: () => onCardClicked(index),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
