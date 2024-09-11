part of 'doctor_profile_bloc.dart';

@immutable
sealed class DoctorProfileEvent {}

class SelectDayEvent extends DoctorProfileEvent {
  int day;
  SelectDayEvent(this.day);
}

class SelectTimeEvent extends DoctorProfileEvent {
  String time;
  SelectTimeEvent(this.time);
}
