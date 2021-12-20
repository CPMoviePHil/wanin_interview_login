import 'package:flutter/material.dart';
import 'package:wanin_interview_login/utils/utils.dart';

class FullButton extends StatelessWidget {

  const FullButton ({
    Key? key,
    required this.buttonLabel,
    required this.onPressed,
    required this.fontColor,
    required this.buttonColor,
    required this.padding,
    required this.fontWeight,
  }) : super (key: key,);

  final String buttonLabel;
  final VoidCallback? onPressed;
  final Color? fontColor;
  final Color? buttonColor;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: WidgetsHelper.appButton(
        context: context,
        buttonLabel: buttonLabel,
        color: buttonColor,
        fontColor: fontColor,
        padding: padding,
        fontWeight: fontWeight,
        onPressed: onPressed,
      ),
    );
  }
}