import 'package:expense_tracker/widget/inputs/text_field_widget.dart';
import 'package:flutter/material.dart';

class AmountRow extends StatelessWidget {
  const AmountRow({
    super.key,
    required this.amountController,
    required this.isDarkMode,
  });

  final TextEditingController amountController;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: amountController,
      label: 'Amount',
      isDarkMode: isDarkMode,
      maxLength: 15,
      keyboardType: TextInputType.number,
      prefixLabel: 'PKR',
    );
  }
}
