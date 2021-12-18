import 'package:bloc/bloc.dart';

import 'app.dart';
import 'blocs/blocs_observer.dart';

void main() {
  BlocOverrides.runZoned(() => const App(),
    blocObserver: MyBlocObserver(),
  );
}
