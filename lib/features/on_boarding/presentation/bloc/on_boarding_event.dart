part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingEvent {}

class GoToNextPage extends OnBoardingEvent {}

