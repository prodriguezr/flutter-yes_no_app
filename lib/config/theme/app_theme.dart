import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.pink,
  Colors.orange,
  Colors.teal,
  Colors.cyan,
  Colors.lime,
  Colors.indigo,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.brown,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
        assert(selectedColor < _colorThemes.length,
            'Selected color must be less than ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
    );
  }
}
