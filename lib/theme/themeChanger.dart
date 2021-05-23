import 'package:flutter/material.dart';
import 'package:tasker/theme/themeData.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  ThemeMode _themeMode;
  ThemeChanger(this._themeData, this._themeMode);
  get getTheme => _themeData;
  set setTheme(themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  get getThemeMode => _themeMode;
  set setThemeMode(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  toggleTheme() {
    if (getThemeMode == ThemeMode.light) {
      setTheme = AppThemes().darkTheme;
      setThemeMode = ThemeMode.dark;
    } else {
      setTheme = AppThemes().lightTheme;
      setThemeMode = ThemeMode.light;
    }
  }
}
