import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  LoginPage ({
    Key? key,
  }) : super (key: key,);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => LoginPage(),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}