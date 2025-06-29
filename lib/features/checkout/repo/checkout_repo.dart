import '../../../services/stripe_service.dart';
import '../models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  static Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    return await StripeService().makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }
}