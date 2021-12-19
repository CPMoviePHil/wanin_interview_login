import 'package:flutter/material.dart';
import 'package:wanin_interview_login/templates/templates.dart';

class LoadingPage extends StatelessWidget {

  const LoadingPage({Key? key}) : super (key: key,);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoadingPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoadingWidget()),
    );
  }
}