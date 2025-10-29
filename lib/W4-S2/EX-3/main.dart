import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  "OOP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  "DART",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade600],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  "FLUTTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
