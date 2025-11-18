import 'package:flutter/material.dart';

const List<String> seasons = [
  'weather/winter.png',
  'weather/sprint.png',
  'weather/summer.png',
  'weather/fall.png',
];

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black54, width: 3),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "SEASONS",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CountrySeasonCard(countryName: "FRENCH"),
                  SizedBox(width: 10),
                  CountrySeasonCard(countryName: "CAMBODIA"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountrySeasonCard extends StatefulWidget {
  const CountrySeasonCard({super.key, required this.countryName});
  final String countryName;
  @override
  State<CountrySeasonCard> createState() => _CountrySeasonCardState();
}

class _CountrySeasonCardState extends State<CountrySeasonCard> {
  int indexSeasons = 0;

  void nextSeason() {
    setState(() {
      if (indexSeasons == seasons.length - 1) {
        indexSeasons = 0;
      } else {
        indexSeasons += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 180,
      height: 550,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54, width: 3),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: GestureDetector(
                onTap: nextSeason,
                child: Image.asset(seasons[indexSeasons], fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                widget.countryName,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
