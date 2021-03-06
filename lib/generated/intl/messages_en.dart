// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(userName) => "Hello, ${userName}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "afterLoginGreeting": m0,
        "authenticationFailure":
            MessageLookupByLibrary.simpleMessage("Authentication Failure"),
        "changePassword":
            MessageLookupByLibrary.simpleMessage("change password"),
        "changePasswordError1":
            MessageLookupByLibrary.simpleMessage("Different Password!"),
        "changePasswordError2":
            MessageLookupByLibrary.simpleMessage("Not Signed in yet!"),
        "changePasswordPageTitle":
            MessageLookupByLibrary.simpleMessage("Change password"),
        "changePasswordSubmit": MessageLookupByLibrary.simpleMessage("submit"),
        "changePasswordSuccessfully":
            MessageLookupByLibrary.simpleMessage("Updated Successfully!"),
        "confirmPassword": MessageLookupByLibrary.simpleMessage("type again"),
        "email": MessageLookupByLibrary.simpleMessage("E-Mail"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid E-Mail"),
        "invalidPassword":
            MessageLookupByLibrary.simpleMessage("Invalid Password"),
        "login": MessageLookupByLibrary.simpleMessage("log in"),
        "loginPageTitle": MessageLookupByLibrary.simpleMessage("Log in"),
        "newPassword": MessageLookupByLibrary.simpleMessage("new password"),
        "password": MessageLookupByLibrary.simpleMessage("Password")
      };
}
