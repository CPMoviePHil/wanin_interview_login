import 'package:flutter/cupertino.dart';
import 'package:wanin_interview_login/configs/configs.dart';
import 'package:logger/logger.dart';

class LogHelper {

  static final Logger _logger = Logger();
  final String msg;
  BuildContext? context;

  LogHelper.d ({
    required this.context,
    required this.msg,
  }) {
    _consoleLog(
      context: context,
    );
  }

  LogHelper.bloc ({
    required this.msg,
  }) {
    _consoleLog(
      context: null,
    );
  }

  void _consoleLog ({
    required BuildContext? context,
  }) {
    if (kEnv) {
      if (context != null) {
        _logger.d("context:${context.owner}, message:$msg");
      } else {
        _logger.d("message:$msg");
      }
    }
  }
}