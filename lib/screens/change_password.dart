import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanin_interview_login/templates/templates.dart';
import 'package:wanin_interview_login/blocs/blocs.dart';

class ChangePasswordPage extends StatelessWidget {

  const ChangePasswordPage ({
    Key? key,
  }) : super (key: key,);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ChangePasswordPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ChangePasswordBloc(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: const ChangePasswordForm(),
          ),
        ),
      ),
    );
  }
}