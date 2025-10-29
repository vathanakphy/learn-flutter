import 'package:basic/W3-S3-Theory/gradiant_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        // margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            GradiantButton(
              text: "Flutter",
              start: Colors.blue,
              stop: Colors.red,
            ),
            GradiantButton(
              text: "Flutter",
              start: Colors.blue,
              stop: Colors.red,
            ),
            GradiantButton(
              text: "Flutter",
              start: Colors.blue,
              stop: Colors.red,
            ),
          ],
        ),
      ),
    ),
  );
}
