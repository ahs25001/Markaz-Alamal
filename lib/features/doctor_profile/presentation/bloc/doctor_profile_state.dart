part of 'doctor_profile_bloc.dart';
enum DoctorProfileStatus { initial, success, failure }
@immutable
class DoctorProfileState {
   DoctorProfileStatus ?status;
  String ? selectedTime;
  int ? selectedDay;
  DoctorProfileState({
    this.status,
    this.selectedTime,
    this.selectedDay
  });
  DoctorProfileState copyWith({DoctorProfileStatus? status, String? selectedTime, int? selectedDay}) {
    return DoctorProfileState(
      status: status ?? this.status,
      selectedTime: selectedTime ?? this.selectedTime,
      selectedDay: selectedDay ?? this.selectedDay
    );
  }
}

final class DoctorProfileInitial extends DoctorProfileState {

  DoctorProfileInitial() : super(status: DoctorProfileStatus.initial);
}
