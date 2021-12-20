import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:wanin_interview_login/generated/l10n.dart';
import 'package:wanin_interview_login/utils/utils.dart';
import 'package:wanin_interview_login/types/types.dart';
import 'package:wanin_interview_login/blocs/blocs.dart';

import 'templates.dart';

class ChangePasswordForm extends StatelessWidget {

  const ChangePasswordForm ({
    Key? key,
  }) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) async {
        final messenger = SnackBarHelper.init(context: context);
        final dialogHelper = DialogHelper.init(context: context);
        if (state.status.isSubmissionFailure) {
          dialogHelper.dismissDialog();
          messenger.showSnackBar(
            message: state.error!,
          );
        } else if (state.status.isSubmissionInProgress) {
          dialogHelper.appShowDialog(
            dismissible: false,
            type: DialogType.loading,
          );
        } else if (state.status.isSubmissionSuccess) {
          messenger.showSnackBar(message: S.of(context).changePasswordSuccessfully,);
          dialogHelper.dismissDialog();
          await Future.delayed(const Duration(milliseconds: 500));
          messenger.hideSnackBar();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
          WidgetsHelper.appText(
            text: S.of(context).changePasswordPageTitle,
            size: WidgetSize.extremeLarge,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 35,),
          const _NewPassword(),
          const SizedBox(height: 25,),
          const _ConfirmPassword(),
          const SizedBox(height: 25,),
          const ChangePasswordButton(),
        ],
      ),
    );
  }
}

class _NewPassword extends StatelessWidget {

  const _NewPassword({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return WidgetsHelper.appTextFormField(
          context: context,
          onChange: (password) => context.read<ChangePasswordBloc>().add(NewPasswordChanged(password)),
          obscure: true,
          hintMessage: S.of(context).newPassword,
          errorMessage: state.password.invalid ? S.of(context).invalidPassword : null,
        );
      },
    );
  }
}

class _ConfirmPassword extends StatelessWidget {

  const _ConfirmPassword({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        return WidgetsHelper.appTextFormField(
          context: context,
          onChange: (confirmPassword) => context.read<ChangePasswordBloc>().add(ConfirmPasswordChanged(confirmPassword)),
          obscure: true,
          hintMessage: S.of(context).confirmPassword,
          errorMessage: state.password.invalid ? S.of(context).invalidPassword : null,
        );
      },
    );
  }
}