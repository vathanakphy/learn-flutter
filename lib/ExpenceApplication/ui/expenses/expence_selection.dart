import 'package:basic/ExpenceApplication/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseSelection extends StatefulWidget {
  const ExpenseSelection({
    super.key,
    required this.list,
    required this.onChanged,
  });

  final List<Category> list;
  final void Function(Category value) onChanged;

  @override
  State<ExpenseSelection> createState() => _ExpenseSelectionState();
}

class _ExpenseSelectionState extends State<ExpenseSelection> {
  late Category selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    final entries = widget.list
        .map((category) => DropdownMenuEntry<Category>(
              value: category,
              label: category.name,
            ))
        .toList();

    return DropdownMenu<Category>(
      initialSelection: selectedCategory,
      onSelected: (Category? value) {
        if (value == null) return;
        setState(() => selectedCategory = value);
        widget.onChanged(value); // parent gets enum value directly
      },
      dropdownMenuEntries: entries,
    );
  }
}
