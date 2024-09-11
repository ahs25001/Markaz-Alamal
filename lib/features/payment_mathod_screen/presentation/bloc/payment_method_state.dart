part of 'payment_method_bloc.dart';

enum PaymentMethodStatus { initial, loading, success, failure }

@immutable
class PaymentMethodState {
  PaymentMethodStatus? paymentMethodStatus;
  int? selectedMethod;

  PaymentMethodState({this.paymentMethodStatus, this.selectedMethod});

  PaymentMethodState copyWith(
      {PaymentMethodStatus? paymentMethodStatus, int? selectedMethod}) {
    return PaymentMethodState(
        paymentMethodStatus: paymentMethodStatus ?? this.paymentMethodStatus,
        selectedMethod: selectedMethod ?? this.selectedMethod);
  }
}

final class PaymentMethodInitial extends PaymentMethodState {
  PaymentMethodInitial() : super(paymentMethodStatus: PaymentMethodStatus.initial);
}
