part of 'on_boarding_bloc.dart';

enum OnBoardingStatus { initial }

@immutable
class OnBoardingState {
  OnBoardingStatus? onBoardingStatus;
  int currentIndex = 0;

  OnBoardingState({this.onBoardingStatus, this.currentIndex = 0});

  OnBoardingState copyWith(
      {OnBoardingStatus? onBoardingStatus, int? currentIndex}) {
    return OnBoardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      onBoardingStatus: onBoardingStatus ?? this.onBoardingStatus,
    );
  }
}

final class OnBoardingInitial extends OnBoardingState {
  OnBoardingInitial() : super(onBoardingStatus: OnBoardingStatus.initial);
}
