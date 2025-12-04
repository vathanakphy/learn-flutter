import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
    this.label, {
    super.key,
    required this.onTap,
    this.icon,
    this.color = Colors.white,
  });

  final Color color;
  final IconData? icon;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton.icon(
        icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
        label: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        ),
      ),
    );
  }
}
