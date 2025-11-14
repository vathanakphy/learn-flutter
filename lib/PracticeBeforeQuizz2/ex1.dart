import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          // YOUR CODE
          children: [
            Container(
              color: Colors.blue,
              padding: EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 100, height: 50, color: Colors.amberAccent),
                  Container(width: 100, height: 50, color: Colors.amberAccent),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(flex: 3, child: Container(color: Colors.orange)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
