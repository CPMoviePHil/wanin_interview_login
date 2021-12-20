import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:wanin_interview_login/blocs/fields/password.dart';
import 'package:wanin_interview_login/generated/l10n.dart';
import 'package:wanin_interview_login/repositories/repositories.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository, super(const ChangePasswordState()) {
    on<NewPasswordChanged>(_onNewPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ChangePasswordSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onNewPasswordChanged(
      NewPasswordChanged event,
      Emitter<ChangePasswordState> emit,
      ) {
    final newPassword = Password.dirty(event.password);
    emit(state.copyWith(
      password: newPassword,
      status: Formz.validate([state.confirmPassword, newPassword]),
    ));
  }

  void _onConfirmPasswordChanged(
      ConfirmPasswordChanged event,
      Emitter<ChangePasswordState> emit,
      ) {
    final confirmPassword = Password.dirty(event.confirmPassword);
    emit(state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([confirmPassword, state.password]),
    ));
  }

  void _onSubmitted(
      ChangePasswordSubmitted event,
      Emitter<ChangePasswordState> emit,
      ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      print("state:${state.password} :${state.confirmPassword}");
      if (state.password.value == state.confirmPassword.value) {
        final currentUser = FirebaseAuth.instance.currentUser;
        print("currentUser:$currentUser");
        if (currentUser != null) {
          try {
            await currentUser.updatePassword(state.password.value);
            _authenticationRepository.logOut();
            emit(state.copyWith(status: FormzStatus.submissionSuccess));
          } catch (_) {
            emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              error: _.toString(),
            ));
          }
        } else {
          emit(state.copyWith(
            status: FormzStatus.submissionFailure,
            error: S.current.changePasswordError2,
          ));
        }
      } else {
        emit(state.copyWith(
          status: FormzStatus.submissionFailure,
          error: S.current.changePasswordError1,
        ));
      }
    }
  }
}
