import 'package:flutter/material.dart';
import 'package:tasker/theme/themeColors.dart';
Widget appRaisedButton({
  @required Color color,
  @required String text,
  @required Function onTap,
}) {
  return RaisedButton(
    splashColor: color.withOpacity(0.5),
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: Text(
      text,
      style: TextStyle(color: ThemeColors.lightScaffoldColor),
    ),
    onPressed: onTap,
  );
}
