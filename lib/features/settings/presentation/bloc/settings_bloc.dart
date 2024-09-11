import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  static SettingsBloc get(context) => BlocProvider.of(context);
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {
      if (event is ChangeCurrentPasswordVisibilityEvent) {
        emit(state.copyWith(
            isCurrentPasswordVisible:
                !(state.isCurrentPasswordVisible ?? false)));
      } else if (event is ChangeNewPasswordVisibilityEvent) {
        emit(state.copyWith(
            isNewPasswordVisible: !(state.isNewPasswordVisible ?? false)));
      } else if (event is ChangeConfirmPasswordVisibilityEvent) {
        emit(state.copyWith(
            isConfirmPasswordVisible:
                !(state.isConfirmPasswordVisible ?? false)));
      }
    });
  }
}
