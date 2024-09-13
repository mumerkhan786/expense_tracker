import 'package:flutter/material.dart';
import 'package:expense_tracker/main.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.isDarkMode,
    required this.keyboardType,
    required this.prefixLabel,
    required this.maxLength,
  });

  final TextEditingController controller;
  final String label;
  final String prefixLabel;
  final int maxLength;
  final bool isDarkMode;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: maxLength,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        label: Text(label),
        prefixText: prefixLabel,
      ),
      style: TextStyle(
        color: isDarkMode
            ? kDarkColorScheme.onSecondaryContainer
            : kColorScheme.onSecondaryContainer,
      ),
    );
  }
}
