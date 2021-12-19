import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'blocs/blocs_observer.dart';
import 'package:wanin_interview_login/repositories/repositories.dart';

void main() {
  runApp(
    BlocOverrides.runZoned(() => App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
      blocObserver: MyBlocObserver(),
    ),
  );
}
