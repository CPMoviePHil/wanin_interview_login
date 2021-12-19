import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {

  final Color? loadingColor;

  const LoadingWidget({
    Key? key,
    this.loadingColor,
  }) : super (key: key,);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: loadingColor ?? Colors.black,
    );
  }
}