import 'package:flutter/material.dart';

// Define a custom color for the theme
const Color _customColor = Color(0xFF5C11D4);

// Define a list of color themes
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.orange,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  // Initialize the AppTheme with a selected color index
  AppTheme({this.selectedColor = 0})
      : assert(
          selectedColor >= 0 && selectedColor < _colorThemes.length - 1,
          'Color must be between 0 and ${_colorThemes.length}',
        );

  ThemeData getTheme() {
    // Create a ThemeData object with the selected color and other theme properties
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      scaffoldBackgroundColor: Colors.grey[300],
      dividerTheme: const DividerThemeData(space: 2.0),
    );
  }
}
