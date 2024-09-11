part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}
class ChangeCurrentPasswordVisibilityEvent extends SettingsEvent {}
class ChangeNewPasswordVisibilityEvent extends SettingsEvent {}
class ChangeConfirmPasswordVisibilityEvent extends SettingsEvent {}
