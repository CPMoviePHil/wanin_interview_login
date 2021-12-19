import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanin_interview_login/blocs/blocs.dart';
import 'package:wanin_interview_login/repositories/repositories.dart';
import 'package:wanin_interview_login/templates/templates.dart';

class LoginPage extends StatelessWidget {

  const LoginPage ({
    Key? key,
  }) : super (key: key,);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
              RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }
}