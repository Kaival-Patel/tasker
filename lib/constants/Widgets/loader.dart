import 'package:flutter/material.dart';
import 'package:tasker/theme/themeColors.dart';

Widget loader({@required double size, Color color, double width}) {
  return SizedBox(
    height: size,
    width: size,
    child: CircularProgressIndicator(
      strokeWidth: width ?? 2,
      valueColor: AlwaysStoppedAnimation<Color>(color ?? ThemeColors.greenColor),
    ),
  );
}
