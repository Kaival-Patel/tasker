import 'package:flutter/material.dart';

Widget appOutlineButton({
  @required Color color,
  @required String text,
  @required Function onTap,
}) {
  return OutlineButton(
    splashColor: color.withOpacity(0.5),
    color: color,
    focusColor: color,
    highlightedBorderColor: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    borderSide: BorderSide(
      color: color,
    ),
    child: Text(
      text,
      style: TextStyle(color: color),
    ),
    onPressed:onTap,
  );
}
