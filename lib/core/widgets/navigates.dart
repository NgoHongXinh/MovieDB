import 'package:flutter/material.dart';

class NavigatesApp {
  // ignore: inference_failure_on_untyped_parameter
  static Future<void> pushReplacementNamed(BuildContext context, name, [data]) {
    return Navigator.of(context).pushReplacementNamed(name, arguments: data);
  }

  // ignore: inference_failure_on_untyped_parameter
  static Future<void> pushNamed(BuildContext context, String name, [data]) {
    return Navigator.of(context).pushNamed(name, arguments: data);
  }

  // ignore: inference_failure_on_untyped_parameter
  static void pop(BuildContext context, {dynamic result}) {
    return Navigator.of(context).pop(result);
  }


  static popRootPushName(BuildContext context, [name, data]) {
    if (name != null) {
      Navigator.popUntil(context, (route) => route.isFirst);
      return Navigator.of(context).pushNamed(name, arguments: data);
    }
    return Navigator.popUntil(context, (route) => route.isFirst);
  }
}
