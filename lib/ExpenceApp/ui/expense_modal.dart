import 'package:basic/ExpenceApp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseModal extends StatefulWidget {
  final Function(Expense) onAddExpense;

  const ExpenseModal({super.key, required this.onAddExpense});

  @override
  State<ExpenseModal> createState() => _ExpenseModalState();
}

class _ExpenseModalState extends State<ExpenseModal> {
  final title = TextEditingController();
  final amount = TextEditingController();
  @override 
  void dispose() {
    title.dispose();
    amount.dispose();
    super.dispose();
  }

  void saveExpense() {
    String enteredTitle = title.text;
    double enteredAmount = double.tryParse(amount.text) ?? 0.0;
    Expense newExpense = Expense.basic(
      enteredTitle,
      enteredAmount,
      ExpenseType.food,
    );
    widget.onAddExpense(newExpense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: title,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          TextField(
            controller: amount,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              saveExpense();
            },
            child: const Text('Save Expense'),
          ),
        ],
      ),
    );
  }
}

class DialogEmpty extends StatelessWidget {
  const DialogEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please enter a valid title and amount.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
