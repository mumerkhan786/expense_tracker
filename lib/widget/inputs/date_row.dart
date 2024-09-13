import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense_structure.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
    required this.onPresentDate,
    required this.selectedDate,
  });

  final DateTime? selectedDate;
  final void Function() onPresentDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          selectedDate == null
              ? 'No Date Selected'
              : formatter.format(selectedDate!),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        IconButton(
          onPressed: onPresentDate,
          icon: const Icon(
            Icons.calendar_month,
          ),
        ),
      ],
    );
  }
}
