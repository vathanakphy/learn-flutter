import 'package:flutter/material.dart';

class GradiantButton extends StatelessWidget {
  final String text;
  final LinearGradient? gradient;

  GradiantButton({
    super.key,
    required this.text,
    required Color start,
    required Color stop,
  }) : gradient = LinearGradient(colors: [start, stop]);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
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
