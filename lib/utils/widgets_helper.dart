import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wanin_interview_login/types/types.dart';

typedef TextFormFieldOnChange = Function(String str);

class WidgetsHelper {

  static BorderSide appBorder ({
    required BuildContext context,
    double width = 0.5,
    Color? color,
  }) {
    color ??= Theme.of(context).highlightColor;
    return BorderSide(
      width: width,
      color: color,
    );
  }

  static Icon appIcon ({
    required IconData icon,
    Color? iconColor,
    WidgetSize? size,
  }) {
    double _iconSize = _size(size: size);
    return Icon(
      icon,
      color: iconColor,
      size: _iconSize,
    );
  }

  static Tooltip appIconButton ({
    required BuildContext context,
    required String tooltip,
    required VoidCallback? onTap,
    required Widget iconWidget,
    Color? fontColor,
  }) {
    fontColor ??= Theme.of(context).highlightColor;
    return Tooltip(
      textStyle: WidgetsHelper.appTextStyle(
        fontColor: fontColor,
      ),
      message: tooltip,
      child: IconButton(
        onPressed: onTap,
        icon: iconWidget,
      ),
    );
  }

  static Text appText ({
    required String? text,
    WidgetSize? size,
    TextStyle? style,
    Color? fontColor,
    TextAlign? align,
    double? lineSpacing,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return Text(
      "$text",
      textAlign: align,
      style: style ?? appTextStyle(
        size: size,
        fontColor: fontColor,
        align: align,
        lineSpacing: lineSpacing,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }

  static SelectableText appSelectableText({
    required String? text,
    WidgetSize? size,
    TextStyle? style,
    Color? fontColor,
    TextAlign? align,
    double? lineSpacing,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return SelectableText(
      "$text",
      textAlign: align,
      style: style ?? appTextStyle(
        size: size,
        fontColor: fontColor,
        align: align,
        lineSpacing: lineSpacing,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }

  static TextStyle appTextStyle ({
    WidgetSize? size,
    Color? fontColor,
    TextAlign? align,
    double? lineSpacing,
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    double fontSize = _size(size: size);
    return GoogleFonts.comfortaa(
      textStyle: TextStyle(
        color: fontColor,
        fontSize: fontSize,
        height: lineSpacing,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }

  static TextFormField appTextFormField ({
    bool enableSuggestions = false,
    bool obscure = false,
    required BuildContext context,
    TextFormFieldOnChange? onChange,
    TextEditingController? controller,
    WidgetSize? size,
    int? maxLines,
    Color? fontColor,
    String? errorMessage,
    String? hintMessage,
  }) {
    fontColor ??= Theme.of(context).highlightColor;
    maxLines ??= 1;
    return TextFormField(
      style: appTextStyle(
        size: size,
        fontColor: fontColor,
      ),
      controller: controller,
      onChanged: onChange,
      obscureText: obscure,
      enableSuggestions: enableSuggestions,
      decoration: _textFieldDecoration(
        hintMessage: hintMessage,
        errorMessage: errorMessage,
      ),
      maxLines: maxLines,
    );
  }

  static TextFormField appTextFormFieldReadOnly ({
    required BuildContext context,
    required TextEditingController controller,
    required InputDecoration decoration,
    WidgetSize? size,
    int? maxLines,
    Color? fontColor,
  }) {
    fontColor ??= Theme.of(context).highlightColor;
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      style: appTextStyle(
        size: size,
        fontColor: fontColor,
      ),
      enableSuggestions: false,
      readOnly: true,
      decoration: decoration,
    );
  }

  static InputDecoration _textFieldDecoration ({
    String? errorMessage,
    String? hintMessage,
  }) {
    return InputDecoration(
      hintText: hintMessage,
      errorText: errorMessage,
      enabledBorder: _inputBorder(),
      focusedBorder: _inputBorder(),
    );
  }

  static InputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(
        color: Colors.black,
      ),
    );
  }

  static double _size ({
    required WidgetSize? size,
  }) {
    size ??= WidgetSize.medium;
    switch (size) {
      case WidgetSize.extremeLarge:
        return 35;
      case WidgetSize.large:
        return 25;
      case WidgetSize.small:
        return 16;
      case WidgetSize.extremeSmall:
        return 12;
      default :
        return 20;
    }
  }
}