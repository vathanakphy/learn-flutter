import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.blue.shade300,
        margin: EdgeInsets.all(50),
        padding: EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue.shade600,
            borderRadius: BorderRadius.circular(25)
            ),
            child: Center(
              child: Text("CADT STUDENTS"
              ,style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                decoration: TextDecoration.none
                ),),
              
            ),
        ),
      ),
    ),
  );
}
