import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class NavigationHelpers {

  static Future<void> _pushScreen ({
    required BuildContext context,
    required MaterialPageRoute route,
  }) async {
    await Navigator.push(context, route,);
  }

  static Future<void> pushScreenWithProvider ({
    required BuildContext context,
    required SingleChildWidget notifier,
  }) async {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (_) => notifier,
    );
    _pushScreen(context: context, route: route,);
  }

  static Future<void> pushScreenWithBloc ({
    required BuildContext context,
    required MaterialPageRoute route,
  }) async {
    await _pushScreen(context: context, route: route,);
  }

  static Future<void> pushScreen ({
    required BuildContext context,
    required Widget screen,
  }) async {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (_) => screen,
    );
    await _pushScreen(context: context, route: route,);
  }

  static void popScreen ({
    required BuildContext context,
  }) {
    Navigator.of(context).pop();
  }

  static void popAllScreen ({
    required BuildContext context,
  }) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static Future<void> pushAndUntilScreen ({
    required BuildContext context,
    required Widget screen,
  }) async {
    await Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => screen,
      ), (Route<dynamic> route) => false,
    );
  }
}