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
      listener: (context, state) async {
        final messenger = SnackBarHelper.init(context: context);
        final dialogHelper = DialogHelper.init(context: context);
        if (state.status.isSubmissionFailure) {
          dialogHelper.dismissDialog();
          messenger.showSnackBar(
            message: S.of(context).authenticationFailure,
          );
        } else if (state.status.isSubmissionInProgress) {
          dialogHelper.appShowDialog(
            dismissible: false,
            type: DialogType.loading,
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
            WidgetsHelper.appText(
              text: S.of(context).loginPageTitle,
              size: WidgetSize.extremeLarge,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 35,),
            const _Email(),
            const SizedBox(height: 25,),
            const _Password(),
            const SizedBox(height: 25,),
            const SizedBox(
              width: double.infinity,
              child: _LoginSubmit(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {

  const _Email({Key? key,}) : super(key: key,);

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

  const _Password({Key? key,}) : super(key: key,);

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

class _LoginSubmit extends StatelessWidget {

  const _LoginSubmit({Key? key}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return WidgetsHelper.appButton(
          context: context,
          buttonLabel: S.of(context).login.toUpperCase(),
          color: Colors.black,
          fontColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 20,),
          fontWeight: FontWeight.w600,
          onPressed: state.status.isValidated ? () => context.read<LoginBloc>().add(const LoginSubmitted()) : null,
        );
      },
    );
  }
}