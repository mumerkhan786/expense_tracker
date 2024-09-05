import 'package:expense_tracker/widget/new_expenses.dart';
import 'package:flutter/material.dart';
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
      context: context,
      builder: (ctx) => NewExpenses(
        onSaveExpense: _addNewExpense,
      ),
    );
  }

  void _addNewExpense(expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          const Text("Expense Tracker"),
          Expanded(
            child: ExpenseList(expense: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
