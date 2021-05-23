import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasker/constants/Widgets/toasty.dart';

class AuthException implements Exception {
  String errorCode;
  AuthException({@required this.errorCode});
  handleEmailPasswordSignIn() {
    switch (errorCode) {
      case "user-not-found":
      case "ERROR_USER_NOT_FOUND":
        {
          showToast(
              msg: "User with this email doesn\'t exist.",
              bgColor: Colors.red[200]);
          return 'AuthException: User with this email doesn\'t exist.';
        }
        break;
      case "invalid-email":
      case "ERROR_INVALID_EMAIL":
        {
          showToast(
              msg: "Provide valid Email",
              bgColor: Colors.red[200]);
          return 'AuthException: Invalide Email';
        }
        break;
      case "wrong-password":
      case "ERROR_WRONG_PASSWORD":
        {
          showToast(
              msg: "Email or Password doesn\'t match.",
              bgColor: Colors.red[200]);
          return 'AuthException: Email or Password doesn\'t match.';
        }
        break;
      case "email-already-in-use":
      case "ERROR_EMAIL_ALREADY_IN_USE":
        {
          showToast(
              msg: "Email address is already in use by another account.",
              bgColor: Colors.red[200]);
          return 'AuthException: Email address is already in use by another account.';
        }
        break;
      case "weak-password":
      case "ERROR_WEAK_PASSWORD":
        {
          showToast(msg: "Given password is weak", bgColor: Colors.red[200]);
          return 'AuthException: Given password is weak';
        }
        break;
      default:
        {
          showToast(msg: errorCode, bgColor: Colors.red[200]);
          return 'AuthException: $errorCode';
        }
    }
  }
}


