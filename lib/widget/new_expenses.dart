import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense_structure.dart';
import 'package:expense_tracker/widget/inputs/text_field_widget.dart';
import 'package:expense_tracker/widget/inputs/amount_row.dart';
import 'package:expense_tracker/widget/inputs/catergory_dropdown.dart';
import 'package:expense_tracker/widget/inputs/date_row.dart';
import 'package:expense_tracker/widget/actions/action_buttons.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onSaveExpense});

  final void Function(ExpenseStructure expense) onSaveExpense;

  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 1,
      now.month,
      now.day,
    );
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountInValid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountInValid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Invalid Input',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          content: Text(
            'Please make sure a valid title, amount, date and category was entered!',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onSaveExpense(
      ExpenseStructure(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedDate!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        final isWideScreen = constraints.maxWidth >= 600;

        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  if (isWideScreen)
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                controller: _titleController,
                                label: 'Title',
                                isDarkMode: isDarkMode,
                                keyboardType: TextInputType.text,
                                prefixLabel: '',
                                maxLength: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: AmountRow(
                                amountController: _amountController,
                                isDarkMode: isDarkMode,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            CatergoryDropdown(
                              selectedCatergory: _selectedCategory,
                              isDarkMode: isDarkMode,
                              onChanged: (value) {
                                setState(() {
                                  if (value == null) {
                                    return;
                                  }
                                  _selectedCategory = value;
                                });
                              },
                            ),
                            const Spacer(),
                            DateRow(
                              selectedDate: _selectedDate,
                              onPresentDate: _presentDatePicker,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ActionButton(
                          onSave: _submitExpenseData,
                          onCancel: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        TextFieldWidget(
                          controller: _titleController,
                          label: 'Title',
                          isDarkMode: isDarkMode,
                          keyboardType: TextInputType.text,
                          prefixLabel: '',
                          maxLength: 50,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AmountRow(
                                amountController: _amountController,
                                isDarkMode: isDarkMode,
                              ),
                            ),
                            // const Spacer(),
                            const SizedBox(
                              width: 24,
                            ),
                            DateRow(
                              onPresentDate: _presentDatePicker,
                              selectedDate: _selectedDate,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            CatergoryDropdown(
                              selectedCatergory: _selectedCategory,
                              isDarkMode: isDarkMode,
                              onChanged: (value) {
                                setState(() {
                                  if (value == null) {
                                    return;
                                  }
                                  _selectedCategory = value;
                                });
                              },
                            ),
                            const Spacer(),
                            ActionButton(
                              onSave: _submitExpenseData,
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
