import 'package:flutter/material.dart';
import 'package:wanin_interview_login/types/types.dart';
import 'package:wanin_interview_login/templates/templates.dart';
import 'utils.dart';

class DialogHelper {

  final BuildContext context;

  DialogHelper.init ({
    required this.context,
  });

  Future<void> appShowDialog ({
    required DialogType type,
    bool dismissible = true,
  }) async {
    Widget _dialog;
    switch (type) {
      case DialogType.loading:
      default:
        _dialog = const LoadingDialog();
        break;
    }
    await showDialog(
      barrierDismissible: dismissible,
      context: context,
      builder: (BuildContext context) => _dialog,
    );
  }

  void dismissDialog() {
    NavigationHelpers.popScreen(context: context);
  }
}