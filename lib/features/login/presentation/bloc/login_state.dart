part of 'login_bloc.dart';

enum LoginStatus { initial, emailVerifiedSuccessfully }

@immutable
class LoginState {
  bool? isPasswordVisible;
  LoginStatus? status;

  LoginState({this.isPasswordVisible, this.status});

  LoginState copyWith({bool? isPasswordVisible, LoginStatus? status}) {
    return LoginState(
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        status: status ?? this.status);
  }
}

final class LoginInitial extends LoginState {
  LoginInitial() : super(status: LoginStatus.initial, isPasswordVisible: false);
}
