import 'package:flutter/material.dart';

void main() => runApp(
  MyApp(),
);

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            TheBestCard(title: 'Ronan', description: 'Is the Best'),
            TheBestCard(title: 'tile', description: 'Is the Best'),
            TheBestCard(title: 'tile', description: 'Is the Best'),
            TheBestCard(title: 'tile', description: 'Is the Best'),
    
          ],
        ),
      ),
    );
  }
}

class TheBestCard extends StatefulWidget {
  final String title;
  final String description;
  const TheBestCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<TheBestCard> createState() => _TheBestCardState();
}

class _TheBestCardState extends State<TheBestCard> {
  bool isFavourite = false;

  void favourited() {
    setState(() {
      isFavourite = !isFavourite;
    });
  }

  IconData get icon => isFavourite ? Icons.favorite : Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Container(
      // YOUR
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(widget.description, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          IconButton(
            onPressed: favourited,
            icon: Icon(icon, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
