import 'package:basic/ExpenceApp/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseModal extends StatefulWidget {
  final Function(Expense) onAddExpense;

  const ExpenseModal({super.key, required this.onAddExpense});

  @override
  State<ExpenseModal> createState() => _ExpenseModalState();
}

class _ExpenseModalState extends State<ExpenseModal> {
  String title = '';
  String amount = '';
  DateTime? pickedDate;
  ExpenseType pickedCategory = ExpenseType.leisure;

  Future<void> pickDate() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);

    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: DateTime(now.year + 3, now.month, now.day),
    );

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
            onChanged: (value) => title = value,
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount'),
            ),
            onChanged: (value) => amount = value,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              DropdownButton<ExpenseType>(
                value: pickedCategory,
                items: ExpenseType.values
                    .map(
                      (expenseType) => DropdownMenuItem(
                        value: expenseType,
                        child: Text(expenseType.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      pickedCategory = value;
                    });
                  }
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    pickedDate == null
                        ? 'No date selected'
                        : '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}',
                  ),
                  IconButton(
                    onPressed: pickDate,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  if (pickedDate == null) return; 
                  widget.onAddExpense(
                    Expense(
                      title,
                      double.tryParse(amount) ?? 0,
                      pickedDate!,
                      pickedCategory,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
