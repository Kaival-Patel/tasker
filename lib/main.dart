import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasker/home/view/homePage.dart';
import 'package:tasker/routes/appRoutes.dart';
import 'package:tasker/theme/themeChanger.dart';
import 'package:tasker/theme/themeData.dart';
void main() {
  runApp(TaskerApp());
}

class TaskerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(AppThemes().darkTheme, ThemeMode.dark),
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: "Tasker",
            theme: themeChanger.getTheme,
            themeMode: themeChanger.getThemeMode,
            routes: AppRoutes().routes,
            initialRoute: HomePage.route,
            debugShowCheckedModeBanner: false,

          );
        },
      ),
    );
  }
}
