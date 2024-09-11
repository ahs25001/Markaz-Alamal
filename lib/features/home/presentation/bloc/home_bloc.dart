import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(BuildContext context) => BlocProvider.of<HomeBloc>(context);

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      if (event is ChangeTab) {
        emit(state.copyWith(currentTeb: event.index));
      }
      else if (event is SelectDate){
        emit(state.copyWith(selectedDate: event.date));
      }
      else if (event is ChangeViewTypeEvent){
        emit(state.copyWith(inListView: event.inListView));
      }
    });
  }
}
