import 'package:flutter/material.dart';
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/model/expense_structure.dart';

class CatergoryDropdown extends StatelessWidget {
  const CatergoryDropdown({
    super.key,
    required this.selectedCatergory,
    required this.isDarkMode,
    required this.onChanged,
  });

  final Category selectedCatergory;
  final bool isDarkMode;
  final ValueChanged<Category?> onChanged;

  TextStyle getTextStyle({required bool isCatergory}) => TextStyle(
        fontWeight: isCatergory ? FontWeight.bold : FontWeight.normal,
        color: isDarkMode
            ? kDarkColorScheme.onSecondaryContainer
            : kColorScheme.onSecondaryContainer,
      );

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedCatergory,
        items: Category.values
            .map(
              (category) => DropdownMenuItem(
                value: category,
                child: Text(category.name.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isDarkMode
                          ? kDarkColorScheme.onSecondaryContainer
                          : kColorScheme.onSecondaryContainer,
                    )),
              ),
            )
            .toList(),
        onChanged: onChanged);
  }
}
