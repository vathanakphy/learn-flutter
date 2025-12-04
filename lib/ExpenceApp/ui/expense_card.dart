import 'package:basic/ExpenceApp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  IconData getCategoryIcon(ExpenseType type) {
    switch (type) {
      case ExpenseType.food:
        return Icons.fastfood;
      case ExpenseType.travel:
        return Icons.flight;
      case ExpenseType.leisure:
        return Icons.sports_esports;
      case ExpenseType.work:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          Icon(getCategoryIcon(expense.category), size: 28),
          SizedBox(width: 10),
          Text(
            '${expense.date.year}/${expense.date.month}/${expense.date.day}',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
