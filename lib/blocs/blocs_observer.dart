import 'package:bloc/bloc.dart';
import 'package:wanin_interview_login/utils/utils.dart';

class MyBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    LogHelper.bloc(msg: "${bloc.runtimeType} $change");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LogHelper.bloc(msg: "${bloc.runtimeType} $error $stackTrace");

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    LogHelper.bloc(msg: "${bloc.runtimeType} $transition");
  }
}