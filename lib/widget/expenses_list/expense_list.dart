import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/expenses_list/expense_item.dart';
import 'package:expense_tracker/model/expense_structure.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expense, required this.onRemoveExpense});

  final List<ExpenseStructure> expense;
  final void Function(ExpenseStructure expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        key: ValueKey(expense[index]),
        onDismissed: (direction) {
          onRemoveExpense(
            expense[index],
          );
        },
        child: ExpenseItem(
          expense[index],
        ),
      ),
    );
  }
}
