import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasker/landingPage/view/landingPage.dart';
import 'package:tasker/routes/appRoutes.dart';
import 'package:tasker/theme/themeChanger.dart';
import 'package:tasker/theme/themeData.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            initialRoute: LandingPage.route,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
