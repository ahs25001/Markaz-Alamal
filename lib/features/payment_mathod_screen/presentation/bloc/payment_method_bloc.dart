import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'payment_method_event.dart';

part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  static PaymentMethodBloc get(context) => BlocProvider.of(context);

  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) {
      if (event is SelectPaymentMethodEvent) {
        emit(state.copyWith(selectedMethod: event.method));
      }
    });
  }
}
