import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData.brightness == Brightness.dark;

  Future<void> changeTheme() async {
    // final prefs = await SharedPreferences.getInstance();

    // prefs.setInt('theme', themeData.brightness == Brightness.dark ? 1 : 0);

    _themeData = (themeData.brightness == Brightness.dark)
        ? ThemeData.light()
        : ThemeData.dark();

    notifyListeners();
  }
}
