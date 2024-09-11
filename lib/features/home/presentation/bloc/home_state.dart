part of 'home_bloc.dart';

enum HomeStatus { initial, success, failure }

@immutable
class HomeState {
  HomeStatus? homeStatus;
  bool inListView;
  int currentTeb;
  DateTime? selectedDate;

  HomeState(
      {this.homeStatus = HomeStatus.initial,
      this.currentTeb = 0,
      this.selectedDate,
      this.inListView = true});

  HomeState copyWith(
      {HomeStatus? homeStatus,
      int? currentTeb,
      DateTime? selectedDate,
      bool? inListView}) {
    return HomeState(
        inListView: inListView ?? this.inListView,
        homeStatus: homeStatus ?? this.homeStatus,
        selectedDate: selectedDate ?? this.selectedDate,
        currentTeb: currentTeb ?? this.currentTeb);
  }
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(homeStatus: HomeStatus.initial, currentTeb: 0);
}
