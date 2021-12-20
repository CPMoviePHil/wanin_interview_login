import 'package:flutter/material.dart';
import 'package:wanin_interview_login/generated/l10n.dart';
import 'package:wanin_interview_login/utils/utils.dart';
import 'package:wanin_interview_login/models/models.dart';
import 'package:wanin_interview_login/types/types.dart';
import 'package:wanin_interview_login/templates/templates.dart';
import 'screens.dart';

class AfterLoginPage extends StatelessWidget {

  final User user;

  const AfterLoginPage ({
    Key? key,
    required this.user,
  }) : super (key: key,);

  static Route route({
    required User user,
  }) {
    return MaterialPageRoute<void>(
      builder: (_) => AfterLoginPage(
        user: user,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.10,),
              WidgetsHelper.appText(
                text: S.of(context).afterLoginGreeting("${user.userName}"),
                size: WidgetSize.extremeLarge,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 30,),
              FullButton(
                buttonLabel: S.of(context).changePassword.toUpperCase(),
                buttonColor: Colors.black,
                fontColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20,),
                fontWeight: FontWeight.w600,
                onPressed: () => Navigator.of(context).pushAndRemoveUntil<void>(
                  ChangePasswordPage.route(), (route) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}