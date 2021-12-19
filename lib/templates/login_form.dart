import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wanin_interview_login/blocs/blocs.dart';
import 'package:wanin_interview_login/generated/l10n.dart';
import 'package:wanin_interview_login/types/types.dart';
import 'package:wanin_interview_login/utils/utils.dart';

class LoginForm extends StatelessWidget {

  const LoginForm ({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          final messenger = SnackBarHelper.init(context: context);
          messenger.showSnackBar(
            message: S.of(context).authenticationFailure,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
            WidgetsHelper.appText(
              text: S.of(context).loginPageTitle,
              size: WidgetSize.extremeLarge,
            ),
            const SizedBox(height: 35,),
            _Email(),
            const SizedBox(height: 25,),
            _Password(),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return WidgetsHelper.appTextFormField(
          context: context,
          onChange: (email) => context.read<LoginBloc>().add(
            LoginEmailChanged(email),
          ),
          hintMessage: S.of(context).email,
          errorMessage: state.email.invalid ? S.of(context).invalidEmail : null,
        );
      },
    );
  }
}

class _Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return WidgetsHelper.appTextFormField(
          context: context,
          onChange: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
          obscure: true,
          hintMessage: S.of(context).password,
          errorMessage: state.password.invalid ? S.of(context).invalidPassword : null,
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          child: const Text('Login'),
          onPressed: state.status.isValidated
              ? () {
            context.read<LoginBloc>().add(const LoginSubmitted());
          }
              : null,
        );
      },
    );
  }
}