part of 'privacy_bloc.dart';

@immutable
sealed class PrivacyEvent {}

class ChaneNameActivity extends PrivacyEvent {
  bool newValue;

  ChaneNameActivity(this.newValue);
}

class ChaneEmailActivity extends PrivacyEvent{
  bool newValue;

  ChaneEmailActivity(this.newValue);
}
class ChanePhoneActivity extends PrivacyEvent{
  bool newValue;

  ChanePhoneActivity(this.newValue);
}
class ChaneRecommendationsActivity extends PrivacyEvent{
  bool newValue;

  ChaneRecommendationsActivity(this.newValue);
}
