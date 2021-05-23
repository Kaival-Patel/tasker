import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  UserCredential user;
  HomePage({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(user.user.uid),
      ),
    );
  }
}
