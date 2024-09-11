import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'on_boarding_event.dart';

part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  PageController pageController = PageController();
static OnBoardingBloc get(BuildContext context) => BlocProvider.of(context);
  OnBoardingBloc() : super(OnBoardingInitial()) {
    on<OnBoardingEvent>((event, emit) {
      if (event is GoToNextPage) {
        pageController.nextPage(duration: 300.ms, curve: Curves.linear);
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      }
    });
  }
}
