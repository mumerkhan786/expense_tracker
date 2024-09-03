import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense_structure.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expense});

  final List<ExpenseStructure> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => Text(expense[index].title),
    );
  }
}
