import 'package:basic/ExpenceApplication/ui/expenses/expence_selection.dart';
import 'package:basic/ExpenceApplication/ui/expenses/expense_date_picker.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _categorySelected = Category.food;
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  void onCreate() {
    String title = _titleController.text.trim();
    double? amount = double.tryParse(_amountController.text.trim());

    String? message; 

    if (title.isEmpty) {
      message = "Title cannot be empty.";
    } else if (amount == null || amount <= 0) {
      message = "Amount must be a valid number greater than 0.";
    }

    if (message != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Invalid Input"),
          content: Text(message!),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }

    Expense newExpense = Expense(
      title: title,
      amount: amount!,
      date: _selectedDate,
      category: _categorySelected,
    );

    Navigator.pop(context, newExpense);
  }

  void onCancel() {
    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                  decoration: InputDecoration(label: Text("Amount")),
                  maxLength: 50,
                ),
              ),
              SizedBox(width: 40),
              ExpenseDatePicker(
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
            ],
          ),
          Text("Select Category:"),
          ExpenseSelection(
            list: [
              Category.food,
              Category.travel,
              Category.leisure,
              Category.work,
            ],
            onChanged: (value) => {_categorySelected = value},
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
          SizedBox(height: 10),
          ElevatedButton(onPressed: onCreate, child: Text("Create")),
        ],
      ),
    );
  }
}
