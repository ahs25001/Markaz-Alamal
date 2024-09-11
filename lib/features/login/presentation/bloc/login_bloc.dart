import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  static LoginBloc get(BuildContext context) => BlocProvider.of(context);

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is ChangePasswordVisibility) {
        emit(state.copyWith(
            isPasswordVisible: !(state.isPasswordVisible ?? false)));
      } else if (event is VerifyEmail) {
        emit(state.copyWith(status: LoginStatus.emailVerifiedSuccessfully));
      }
    });
  }
}
