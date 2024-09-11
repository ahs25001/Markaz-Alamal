part of 'settings_bloc.dart';
enum SettingsStatus { initial, loading, success, failure }
@immutable
class SettingsState {
  SettingsStatus? settingsStatus ;
  bool? isCurrentPasswordVisible;
  bool? isNewPasswordVisible;
  bool? isConfirmPasswordVisible;
  SettingsState({
    this.settingsStatus,
    this.isCurrentPasswordVisible,
    this.isNewPasswordVisible,
    this.isConfirmPasswordVisible,
  });
  SettingsState copyWith({
    SettingsStatus? settingsStatus,
    bool? isCurrentPasswordVisible,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return SettingsState(
      settingsStatus: settingsStatus ?? this.settingsStatus,
      isCurrentPasswordVisible:
          isCurrentPasswordVisible ?? this.isCurrentPasswordVisible,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }
}

final class SettingsInitial extends SettingsState {
  SettingsInitial() : super(settingsStatus: SettingsStatus.initial);
}
