import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tasker/theme/themeColors.dart';

showToast({@required String msg, Color bgColor}) {
  Fluttertoast.showToast(
      webBgColor: "#0BAB64",
      timeInSecForIosWeb: 3,
      msg: msg, backgroundColor: bgColor ?? ThemeColors.greenColor);
}