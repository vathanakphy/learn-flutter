import 'package:uuid/uuid.dart';

enum ExpenseType { food, travel, leisure, work }

class Expense {
  static List<Expense> listExpense = [];

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense(this.title, this.amount, this.date, this.category)
    : id = const Uuid().v1();

  Expense.load(this.id, this.title, this.amount, this.date, this.category);

  factory Expense.basic(String title, double amount, ExpenseType category) {
    return Expense(title, amount, DateTime.now(), category);
  }
}
