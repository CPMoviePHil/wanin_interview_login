import 'package:flutter/material.dart';

class SnackBarHelper {

  final BuildContext context;
  late final ScaffoldMessengerState _messenger;

  SnackBarHelper.init({
    required this.context,
  }) {
    _messenger = ScaffoldMessenger.of(context);
  }

  void showSnackBar ({
    required String message,
  }) {
    hideSnackBar();
    _messenger.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void hideSnackBar() {
    _messenger.hideCurrentSnackBar();
  }
}