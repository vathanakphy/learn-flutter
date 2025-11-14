import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          children: [
            SelectionButton(),
            SizedBox(height: 30,),
            SelectionButton(),
            SizedBox(height: 30,),
            SelectionButton(),
            SizedBox(height: 30,),
            SelectionButton(),
          ],
        ),
      ),
    ),
  ),
);

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  bool isSelected = false;

  void select() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  String get label => (isSelected) ? 'Selected' : 'Not Selected';

  Color get textColor => (isSelected) ? Colors.white : Colors.black;

  Color get backgroundColor =>
      (isSelected) ? Colors.blue.shade500 : Colors.blue.shade50;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: select,
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Center(
          child: Text(label, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
