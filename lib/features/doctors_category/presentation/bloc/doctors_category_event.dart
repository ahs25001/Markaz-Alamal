part of 'doctors_category_bloc.dart';

@immutable
sealed class DoctorsCategoryEvent {}

class ChangeViewTypeEvent extends DoctorsCategoryEvent {
  bool inListView;

  ChangeViewTypeEvent(this.inListView);
}
