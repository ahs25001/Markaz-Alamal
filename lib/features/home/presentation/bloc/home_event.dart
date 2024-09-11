part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
class ChangeTab extends HomeEvent {
  final int index;
  ChangeTab({required this.index});
}
class SelectDate extends HomeEvent {
  final DateTime date;
  SelectDate( this.date);
}
class ChangeViewTypeEvent extends HomeEvent {
  final bool inListView;
  ChangeViewTypeEvent( this.inListView);
}