import 'dart:ui';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

ThemeData darkTheme = createTheme(Brightness.dark, shape);

ThemeData lightTheme = createTheme(Brightness.light, shape);
RoundedRectangleBorder shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

ThemeData createTheme(Brightness brightness, s) {
  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorSchemeSeed: const Color(0xFF2C6C2F),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: s,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: s,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: s,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: s,
      ),
    ),
  );
}

bool isDarkMode(BuildContext context) {
  final theme = Theme.of(context).brightness;
  return theme == Brightness.dark;
}

class ThemeModel with ChangeNotifier {
  bool _isDarkMode = window.platformBrightness == Brightness.dark;

  ThemeModel() {
    window.onPlatformBrightnessChanged = _handleBrightnessChange;
  }

  bool get isDarkMode => _isDarkMode;

  @override
  void dispose() {
    window.onPlatformBrightnessChanged = null;
    super.dispose();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    Consumer<ThemeModel>(
      builder: (context, themeModel, _) {
        print('toggleTheme from ThemeModel');
        themeModel.toggleTheme();
        return const SizedBox(height: 0);
      },
    );
    notifyListeners();
  }

  void _handleBrightnessChange() {
    _isDarkMode = window.platformBrightness == Brightness.dark;
    notifyListeners();
  }
}
