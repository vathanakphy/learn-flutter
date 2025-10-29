import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        // margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            CustomCard(text: "OOP", color: Colors.blue[100]),
            CustomCard(text: "DART", color: Colors.blue[300]),
            CustomCard.gradient(
              text: "FLUTTER",
              gradient: LinearGradient(
                colors: [Colors.blue.shade300, Colors.blue.shade600],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final LinearGradient? gradient;

  const CustomCard({super.key, required this.text, this.color = Colors.blue})
    : gradient = null;

  const CustomCard.gradient({
    super.key,
    required this.text,
    required this.gradient,
  }) : color = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
