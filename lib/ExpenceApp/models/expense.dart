import 'package:uuid/uuid.dart';

enum ExpenseType { food, travel, leisure, work }

class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  ExpenseType category;
  Expense(this.title, this.amount, this.date, this.category) : id = Uuid().v1();
  Expense.load(this.id, this.title, this.amount, this.date, this.category);
}
