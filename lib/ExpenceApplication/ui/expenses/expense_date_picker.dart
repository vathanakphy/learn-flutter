import 'package:flutter/material.dart';

class ExpenseDatePicker extends StatefulWidget {
  final ValueChanged<DateTime> onDateChanged;

  const ExpenseDatePicker({super.key, required this.onDateChanged});

  @override
  State<ExpenseDatePicker> createState() => _ExpenseDatePickerState();
}

class _ExpenseDatePickerState extends State<ExpenseDatePicker> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    setState(() {
      selectedDate = pickedDate;
    });
    if (pickedDate != null) {
      widget.onDateChanged(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              : 'No date selected',
        ),
        IconButton(onPressed: _selectDate, icon: Icon(Icons.date_range_outlined))
      ],
    );
  }
}
