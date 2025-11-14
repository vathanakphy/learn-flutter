import 'package:flutter/material.dart';

List<String> images = [
  "w4-s2/bird.jpg",
  "w4-s2/bird2.jpg",
  "w4-s2/insect.jpg",
  "w4-s2/girl.jpg",
  "w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner:
        false, // Why this line ? Can you explain it ?
        // ANS: diable debig UI on the top right
    home: ImageGallery(),
  ),
);

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 0;

  void onNext() {
    setState(() {
      if (currentIndex == images.length - 1) {
        currentIndex = 0;
      } else {
        currentIndex += 1;
      }
    });
  }

  void onPrev() {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = images.length - 1;
      } else {
        currentIndex -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: onPrev,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: onNext,
            ),
          ),
        ],
      ),
      body: Image.asset(images[currentIndex]),
    );
  }
}
