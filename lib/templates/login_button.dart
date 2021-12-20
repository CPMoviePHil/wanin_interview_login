import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wanin_interview_login/blocs/blocs.dart';
import 'package:wanin_interview_login/generated/l10n.dart';
import 'package:wanin_interview_login/templates/templates.dart';

class LoginButton extends StatelessWidget {

  const LoginButton ({
    Key? key,
  }) : super (key: key,);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return FullButton(
          buttonLabel: S.of(context).login.toUpperCase(),
          buttonColor: Colors.black,
          fontColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20,),
          fontWeight: FontWeight.w600,
          onPressed: state.status.isValidated ? () => context.read<LoginBloc>().add(const LoginSubmitted()) : null,
        );
      },
    );
  }
}