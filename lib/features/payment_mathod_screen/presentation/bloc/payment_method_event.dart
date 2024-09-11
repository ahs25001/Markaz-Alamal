part of 'payment_method_bloc.dart';

@immutable
sealed class PaymentMethodEvent {}
class SelectPaymentMethodEvent extends PaymentMethodEvent {
  int method;

  SelectPaymentMethodEvent(this.method);
}