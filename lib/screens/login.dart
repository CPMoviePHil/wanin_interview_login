import 'package:flutter/material.dart';
import 'package:wanin_interview_login/generated/l10n.dart';

class LoginPage extends StatelessWidget {

  const LoginPage ({
    Key? key,
  }) : super (key: key,);

  static const String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(S.of(context).loginPageTitle)
        ],
      ),
    );
  }
}