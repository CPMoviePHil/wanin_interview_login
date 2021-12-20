import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanin_interview_login/templates/templates.dart';
import 'package:wanin_interview_login/blocs/blocs.dart';
import 'package:wanin_interview_login/repositories/repositories.dart';

class ChangePasswordPage extends StatelessWidget {

  const ChangePasswordPage ({
    Key? key,
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository, super (key: key,);

  static Route route({required AuthenticationRepository authenticationRepository}) {
    return MaterialPageRoute<void>(
      builder: (_) => ChangePasswordPage(authenticationRepository: authenticationRepository),
    );
  }

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => ChangePasswordBloc(
            authenticationRepository: _authenticationRepository,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,),
            child: const ChangePasswordForm(),
          ),
        ),
      ),
    );
  }
}