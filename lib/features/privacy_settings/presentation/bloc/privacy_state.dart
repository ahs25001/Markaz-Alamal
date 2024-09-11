part of 'privacy_bloc.dart';

enum PrivacyStatus { init }

@immutable
class PrivacyState {
  PrivacyStatus? privacyStatus;
  bool nameIsActive;
  bool phoneIsActive;
  bool emailIsActive;
  bool recommendationsIsActive;

  PrivacyState(
      {this.privacyStatus,
      this.nameIsActive = true,
      this.phoneIsActive = true,
      this.emailIsActive = true,
      this.recommendationsIsActive = true});

  PrivacyState copyWith(
      {PrivacyStatus? privacyStatus,
      bool? nameIsActive,
      bool? phoneIsActive,
      bool? emailIsActive,
      bool? recommendationsIsActive}) {
    return PrivacyState(
        privacyStatus: privacyStatus ?? this.privacyStatus,
        recommendationsIsActive:
            recommendationsIsActive ?? this.recommendationsIsActive,
        emailIsActive: emailIsActive ?? this.emailIsActive,
        nameIsActive: nameIsActive ?? this.nameIsActive,
        phoneIsActive: phoneIsActive ?? this.phoneIsActive);
  }
}

final class PrivacyInitial extends PrivacyState {
  PrivacyInitial() : super(privacyStatus: PrivacyStatus.init);
}
