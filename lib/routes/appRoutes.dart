import 'package:flutter/material.dart';
import 'package:tasker/home/view/homePage.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> routes = {HomePage.route: (builder)=>HomePage()};
}
