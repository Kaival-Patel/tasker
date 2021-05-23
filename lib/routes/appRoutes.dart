import 'package:flutter/material.dart';
import 'package:tasker/auth/login/view/loginPage.dart';
import 'package:tasker/landingPage/view/landingPage.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> routes = {
    LandingPage.route: (builder)=>LandingPage(),
    LoginPage.route : (builder) => LoginPage()
  };
}
