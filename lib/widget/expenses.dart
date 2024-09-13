import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/chart_bar/chart.dart';
import 'package:expense_tracker/widget/new_expenses.dart';
import 'package:expense_tracker/model/expense_structure.dart';
import 'package:expense_tracker/widget/expenses_list/expense_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseStructure> _registeredExpense = [
    ExpenseStructure(
      title: 'Flutter Course',
      amount: 5000,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseStructure(
      title: 'Cinema',
      amount: 1000,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(
        onSaveExpense: _addNewExpense,
      ),
    );
  }

  void _addNewExpense(ExpenseStructure expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  void _removeExpense(ExpenseStructure expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);

    setState(
      () {
        _registeredExpense.remove(expense);
      },
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(
              () {
                _registeredExpense.insert(expenseIndex, expense);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpense.isNotEmpty) {
      mainContent = ExpenseList(
        expense: _registeredExpense,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(
                  expense: _registeredExpense,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(
                    expense: _registeredExpense,
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
