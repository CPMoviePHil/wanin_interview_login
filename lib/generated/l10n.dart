// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in`
  String get loginPageTitle {
    return Intl.message(
      'Log in',
      name: 'loginPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `log in`
  String get login {
    return Intl.message(
      'log in',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get email {
    return Intl.message(
      'E-Mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Invalid E-Mail`
  String get invalidEmail {
    return Intl.message(
      'Invalid E-Mail',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Password`
  String get invalidPassword {
    return Intl.message(
      'Invalid Password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Authentication Failure`
  String get authenticationFailure {
    return Intl.message(
      'Authentication Failure',
      name: 'authenticationFailure',
      desc: '',
      args: [],
    );
  }

  /// `Hello, {userName}`
  String afterLoginGreeting(Object userName) {
    return Intl.message(
      'Hello, $userName',
      name: 'afterLoginGreeting',
      desc: '',
      args: [userName],
    );
  }

  /// `change password`
  String get changePassword {
    return Intl.message(
      'change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePasswordPageTitle {
    return Intl.message(
      'Change password',
      name: 'changePasswordPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPassword {
    return Intl.message(
      'new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `type again`
  String get confirmPassword {
    return Intl.message(
      'type again',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get changePasswordSubmit {
    return Intl.message(
      'submit',
      name: 'changePasswordSubmit',
      desc: '',
      args: [],
    );
  }

  /// `Updated Successfully!`
  String get changePasswordSuccessfully {
    return Intl.message(
      'Updated Successfully!',
      name: 'changePasswordSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Different Password!`
  String get changePasswordError1 {
    return Intl.message(
      'Different Password!',
      name: 'changePasswordError1',
      desc: '',
      args: [],
    );
  }

  /// `Not Signed in yet!`
  String get changePasswordError2 {
    return Intl.message(
      'Not Signed in yet!',
      name: 'changePasswordError2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
