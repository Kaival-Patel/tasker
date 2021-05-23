import 'package:flutter/material.dart';

Widget customSpacer({double b, double t, double l, double r}) {
  return Padding(padding: EdgeInsets.fromLTRB(l ?? 0, t ?? 0, r ?? 0, b ?? 0));
}
