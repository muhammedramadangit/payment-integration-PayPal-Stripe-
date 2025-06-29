import 'package:checkout_payment/services/api_keys.dart';
import 'package:checkout_payment/services/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../features/checkout/models/ephemeral_key_model.dart';
import '../features/checkout/models/intent_payment_sheet_input_model.dart';
import '../features/checkout/models/payment_intent_input_model.dart';
import '../features/checkout/models/payment_intent_model.dart';

class StripeService {
  ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    Response response = await apiServices.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initialPaymentSheet(
      {required IntentPaymentSheetInputModel intentPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: intentPaymentSheetInputModel.clientSecretKey,
        customerEphemeralKeySecret: intentPaymentSheetInputModel.ephemeralKeySecret,
        customerId: intentPaymentSheetInputModel.customerId,
        merchantDisplayName: "Muhammed ramadan",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    Response response = await apiServices.post(
      body: {"customer": customerId},
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/ephemeral_keys",
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2025-05-28.basil",
      },
    );
    EphemeralKeyModel ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    EphemeralKeyModel ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId!);
    await initialPaymentSheet(intentPaymentSheetInputModel: IntentPaymentSheetInputModel(
      clientSecretKey: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret,
    ),);
    await displayPaymentSheet();
  }
}
