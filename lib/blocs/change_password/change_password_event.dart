part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class NewPasswordChanged extends ChangePasswordEvent {
  const NewPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChanged extends ChangePasswordEvent {
  const ConfirmPasswordChanged(this.confirmPassword);

  final String confirmPassword;

  @override
  List<Object> get props => [confirmPassword];
}

class ChangePasswordSubmitted extends ChangePasswordEvent {
  const ChangePasswordSubmitted();
}
