// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_TW locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_TW';

  static String m0(userName) => "你好, ${userName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "afterLoginGreeting": m0,
        "authenticationFailure": MessageLookupByLibrary.simpleMessage("認證失敗"),
        "changePassword": MessageLookupByLibrary.simpleMessage("更改密碼"),
        "changePasswordPageTitle": MessageLookupByLibrary.simpleMessage("更改密碼"),
        "changePasswordSubmit": MessageLookupByLibrary.simpleMessage("確認"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage("再次輸入"),
        "email": MessageLookupByLibrary.simpleMessage("電子信箱"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("信箱格式錯誤"),
        "invalidPassword": MessageLookupByLibrary.simpleMessage("密碼錯誤"),
        "login": MessageLookupByLibrary.simpleMessage("log in"),
        "loginPageTitle": MessageLookupByLibrary.simpleMessage("登入"),
        "newPassword": MessageLookupByLibrary.simpleMessage("新密碼"),
        "password": MessageLookupByLibrary.simpleMessage("密碼")
      };
}
