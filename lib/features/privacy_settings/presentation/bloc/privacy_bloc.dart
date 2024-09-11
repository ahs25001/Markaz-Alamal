import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'privacy_event.dart';
part 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  static PrivacyBloc get(context) => BlocProvider.of<PrivacyBloc>(context);
  PrivacyBloc() : super(PrivacyInitial()) {
    on<PrivacyEvent>((event, emit) {
      if(event is ChaneNameActivity){
        emit(state.copyWith(nameIsActive: event.newValue));
      }else if (event is ChanePhoneActivity){
        emit(state.copyWith(phoneIsActive: event.newValue));
      }else if (event is ChaneEmailActivity){
        emit(state.copyWith(emailIsActive: event.newValue));
      }else if (event is ChaneRecommendationsActivity){
        emit(state.copyWith(recommendationsIsActive: event.newValue));
      }
    });
  }
}
