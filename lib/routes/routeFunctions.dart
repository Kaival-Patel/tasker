import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteTo {
  push({@required BuildContext context, @required Widget widget}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  pushNamed({@required BuildContext context, @required String routeName}) {
    Navigator.pushNamed(context, routeName);
  }

  pushNamedAndRemoveUntil(
      {@required BuildContext context, @required String routeName}) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  pushReplace({@required BuildContext context, @required Widget widget}) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  pushNameReplaced(
      {@required BuildContext context, @required String routeName}) {
    Navigator.pushReplacementNamed(context, routeName);
  }
}
