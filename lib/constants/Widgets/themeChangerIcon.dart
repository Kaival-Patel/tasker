import 'package:flutter/material.dart';
import 'package:tasker/theme/themeChanger.dart';
import 'package:provider/provider.dart';
class ThemeChangerIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider .of<ThemeChanger>(context);
    return IconButton(
        tooltip: "Change Theme",
        icon: Icon(
          themeProvider.getThemeMode == ThemeMode.dark
              ? Icons.wb_sunny
              : Icons.nightlight_round,
          color: themeProvider.getThemeMode == ThemeMode.dark
              ? Colors.yellow
              : Colors.blue,
        ),
        onPressed: () {
          themeProvider.toggleTheme();
        });
  }
}
