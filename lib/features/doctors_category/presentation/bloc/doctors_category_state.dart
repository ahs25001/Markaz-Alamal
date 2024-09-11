part of 'doctors_category_bloc.dart';

enum DoctorsCategoryStatus { initial, success, failure }

@immutable
class DoctorsCategoryState {
  DoctorsCategoryStatus? doctorsCategoryStatus;

  bool? inListView;

  DoctorsCategoryState({this.doctorsCategoryStatus, this.inListView});

  DoctorsCategoryState copyWith({
    DoctorsCategoryStatus? doctorsCategoryStatus,
    bool? inListView,
  }) {
    return DoctorsCategoryState(
      doctorsCategoryStatus:
          doctorsCategoryStatus ?? this.doctorsCategoryStatus,
      inListView: inListView ?? this.inListView,
    );
  }
}

final class DoctorsCategoryInitial extends DoctorsCategoryState {
  DoctorsCategoryInitial()
      : super(
            doctorsCategoryStatus: DoctorsCategoryStatus.initial,
            inListView: true);
}
