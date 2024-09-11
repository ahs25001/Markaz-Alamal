import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_profile_event.dart';

part 'doctor_profile_state.dart';

class DoctorProfileBloc extends Bloc<DoctorProfileEvent, DoctorProfileState> {
  static DoctorProfileBloc get(context) => BlocProvider.of(context);
  DoctorProfileBloc() : super(DoctorProfileInitial()) {
    on<DoctorProfileEvent>((event, emit) {
      if (event is SelectDayEvent) {
        emit(state.copyWith(selectedDay: event.day));
      } else if (event is SelectTimeEvent) {
        emit(state.copyWith(selectedTime: event.time));
      }
    });
  }
}
