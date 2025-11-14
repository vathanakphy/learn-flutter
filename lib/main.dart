import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[400],

        body: ListView(
          children: [
            ScoreCard(subject: "Flutter"),
            ScoreCard(subject: "Dart"),
            ScoreCard(subject: "NestJS"),
            ScoreCard(subject: "React JS"),
            ScoreCard(subject: "HTML"),
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String subject;

  const ScoreCard({super.key, required this.subject});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;

  void addScore() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void minusScore() {
    setState(() {
      if (score > 0) score--;
    });
  }

  Color get scoreColor {
    double percent = score / 10;
    int shade = ((percent * 8).round() + 1) * 100;
    return Colors.green[shade]!;
  }

  @override
  Widget build(BuildContext context) {
    double percent = score / 10;
    const double maxWidth = 800; 
    double fillWidth = maxWidth * percent; 


    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'My Score in ${widget.subject}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: minusScore,
                icon: const Icon(Icons.remove_circle_outline),
              ),
              IconButton(
                onPressed: addScore,
                icon: const Icon(Icons.add_circle_outline_rounded),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: maxWidth,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black26),
            ),
            child: Stack(
              children: [
                Container(
                  width: fillWidth,
                  decoration: BoxDecoration(
                    color: scoreColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
