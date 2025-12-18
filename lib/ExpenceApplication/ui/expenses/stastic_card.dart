import 'package:flutter/material.dart';

class PriceIconColumn extends StatelessWidget {
  final double price;
  final IconData icon;

  const PriceIconColumn({
    super.key,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        SizedBox(height: 6),
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
