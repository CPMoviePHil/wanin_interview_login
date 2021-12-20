import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'blocs/blocs_observer.dart';
import 'repositories/repositories.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    BlocOverrides.runZoned(() => App(
      authenticationRepository: AuthenticationRepository(),
      userRepository: UserRepository(),
    ),
      blocObserver: MyBlocObserver(),
    ),
  );
}
