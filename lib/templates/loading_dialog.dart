import 'package:flutter/material.dart';
import 'templates.dart';

class LoadingDialog extends StatelessWidget{

  const LoadingDialog({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SimpleDialog(
        key: key,
        elevation: 0,
        backgroundColor: Colors.transparent,
        children: <Widget>[
          Center(
            child: Column(
              children: const <Widget>[
                LoadingWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}