

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import '../event/checkout_event.dart';
import '../models/payment_intent_input_model.dart';
import '../repo/checkout_repo.dart';
import '../state/checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<Update>(_update);
    on<Click>(_makePayment);
  }

  _makePayment(CheckoutEvent event, Emitter<CheckoutState> emit) async {
    PaymentIntentInputModel body = event.arguments as PaymentIntentInputModel;
    emit(CheckoutLoading());
    try {
      await CheckoutRepo.makePayment(paymentIntentInputModel: body);
      emit(CheckoutSuccess());
    } on StripeException catch (e) {
      emit(CheckoutError(error: e.error.message.toString()));
    } catch (exception) {
      emit(CheckoutError(error: exception.toString()));
    }
  }

  _update(CheckoutEvent event, Emitter<CheckoutState> emit) async {
    emit(CheckoutInitial());
  }
}
