import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:wanin_interview_login/blocs/fields/password.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(const ChangePasswordState()) {
    on<NewPasswordChanged>(_onNewPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<ChangePasswordSubmitted>(_onSubmitted);
  }

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
      try {
        /*await _authenticationRepository.logIn(
          email: state.email.value,
          password: state.password.value,
        );*/
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
