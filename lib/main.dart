import 'package:basic/ExpenceApp/main.dart';
import 'package:basic/ExpenceApp/models/expense.dart';
import 'package:flutter/material.dart';

void main() {
  
  Expense.listExpense.add(Expense("Flutter", 100, DateTime.now(), ExpenseType.food));
  Expense.listExpense.add(Expense("Flutter", 100, DateTime.now(), ExpenseType.food));
  Expense.listExpense.add(Expense("Flutter", 100, DateTime.now(), ExpenseType.food));

  runApp(const ExpenseApp());
}
