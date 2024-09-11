part of 'sign_up_bloc.dart';

enum SignUpStatus { initial }

@immutable
class SignUpState {
  SignUpStatus? status;

  bool? isPasswordVisible;
  bool? isConfirmPasswordVisible;

  SignUpState(
      {this.status, this.isPasswordVisible, this.isConfirmPasswordVisible});

  SignUpState copyWith(
      {SignUpStatus? status,
      bool? isPasswordVisible,
      bool? isConfirmPasswordVisible}) {
    return SignUpState(
        status: status ?? this.status,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
        isConfirmPasswordVisible:
            isConfirmPasswordVisible ?? this.isConfirmPasswordVisible);
  }
}

final class SignUpInitial extends SignUpState {
  SignUpInitial()
      : super(
            status: SignUpStatus.initial,
            isPasswordVisible: false,
            isConfirmPasswordVisible: false);
}
