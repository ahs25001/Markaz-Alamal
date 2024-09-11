import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'doctors_category_event.dart';

part 'doctors_category_state.dart';

class DoctorsCategoryBloc
    extends Bloc<DoctorsCategoryEvent, DoctorsCategoryState> {
  static DoctorsCategoryBloc get(context) => BlocProvider.of(context);
  DoctorsCategoryBloc() : super(DoctorsCategoryInitial()) {
    on<DoctorsCategoryEvent>((event, emit) {
      if (event is ChangeViewTypeEvent) {
        emit(state.copyWith(
            inListView: event.inListView));
      }
    });
  }
}
