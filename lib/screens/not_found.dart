import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {

  const NotFoundPage ({
    Key? key,
  }) : super (key: key,);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NotFoundPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}