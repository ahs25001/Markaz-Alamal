import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  static SignUpBloc get(context) => BlocProvider.of<SignUpBloc>(context);
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      if (event is ChangePasswordVisibilityEvent) {
        emit(state.copyWith(
            isPasswordVisible: !(state.isPasswordVisible ?? false)));
      } else if (event is ChangeConfirmPasswordVisibilityEvent) {
        emit(state.copyWith(
            isConfirmPasswordVisible:
                !(state.isConfirmPasswordVisible ?? false)));
      }
    });
  }
}
