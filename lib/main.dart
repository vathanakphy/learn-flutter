import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

enum CardType { red, blue }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  int redTab = 0;
  int blueTab = 0;

  void _onChnageScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _incrementRed() {
    setState(() {
      redTab++;
    });
  }

  void _incrementBlue() {
    setState(() {
      blueTab++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      TabsScreen(
        redTab: redTab,
        blueTab: blueTab,
        onIncRed: _incrementRed,
        onIncBlue: _incrementBlue,
      ),
      StatiticsScreen(redTab: redTab, blueTab: blueTab),
    ];

    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onChnageScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android_sharp),
            label: 'Tabs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stacked_bar_chart_outlined),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class StatiticsScreen extends StatelessWidget {
  const StatiticsScreen({
    super.key,
    required this.redTab,
    required this.blueTab,
  });

  final int redTab;
  final int blueTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Statictis"),
        const SizedBox(height: 20),
        Text('Red taps: $redTab', style: TextStyle(fontSize: 20)),
        Text('Blue taps: $blueTab', style: TextStyle(fontSize: 20)),
      ],
    );
  }
}

class TabsScreen extends StatelessWidget {
  final int redTab;
  final int blueTab;
  final VoidCallback onIncRed;
  final VoidCallback onIncBlue;

  const TabsScreen({
    super.key,
    required this.redTab,
    required this.blueTab,
    required this.onIncRed,
    required this.onIncBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Tabs", style: TextStyle(fontSize: 28)),
        ColorTap(type: CardType.red, onTap: onIncRed, count: redTab),
        ColorTap(type: CardType.blue, onTap: onIncBlue, count: blueTab),
      ],
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final VoidCallback onTap;
  final int count;
  const ColorTap({
    super.key,
    required this.type,
    required this.onTap,
    required this.count,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $count',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
