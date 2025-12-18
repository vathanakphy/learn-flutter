import 'package:basic/ExpenceApplication/ui/expenses/expense_statistic.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_form.dart';
import 'expense_item.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void onAddClicked(BuildContext context) async {
    final expence = await showModalBottomSheet<Expense>(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(child: ExpenseForm()),
    );
    setState(() {
      if (expence != null) {
        _expenses.add(expence);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => {onAddClicked(context)},
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ExpenseStatistic(expenses: _expenses),
          (_expenses.isEmpty)
              ? Expanded(
                  child: Center(
                    child: Text(
                      'No expenses found. Start adding some!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (ctx, index) => Dismissible(
                      key: ValueKey(_expenses[index].id),
                      child: ExpenseItem(expense: _expenses[index]),
                      onDismissed: (DismissDirection direction) {
                        Expense removedExpense = _expenses[index];
                        setState(() {
                          _expenses.removeAt(index);
                        });
                        final messenger = ScaffoldMessenger.of(context);
                        messenger.clearSnackBars();
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text("${removedExpense.title} removed"),
                            action: SnackBarAction(
                              label: "UNDO",
                              onPressed: () {
                                setState(() {
                                  _expenses.insert(index, removedExpense);
                                });
                              },
                            ),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
