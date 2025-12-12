import 'package:basic/ExpenceApplication/ui/expenses/stastic_card.dart';
import 'package:basic/ExpenceApplication/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseStatistic extends StatelessWidget {
  final List<Expense> expenses;
  const ExpenseStatistic({
    super.key,
    required this.expenses,
  });

  double geTotalExpense(Category category) {
    return expenses
        .where((expense) => expense.category == category)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PriceIconColumn(price: geTotalExpense(Category.food), icon: Icons.free_breakfast),
        PriceIconColumn(price: geTotalExpense(Category.travel), icon: Icons.travel_explore),
        PriceIconColumn(price: geTotalExpense(Category.leisure), icon: Icons.holiday_village),
        PriceIconColumn(price: geTotalExpense(Category.work), icon: Icons.work),
      ],
    );
  }
}
