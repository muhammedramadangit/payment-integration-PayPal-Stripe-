import 'package:checkout_payment/features/payment_details/widgets/payment_methods_list.dart';
import 'package:checkout_payment/main_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../services/api_keys.dart';
import '../../success_payment/view/success_payment_view.dart';
import '../bloc/checkout_bloc.dart';
import '../event/checkout_event.dart';
import '../models/payment_intent_input_model.dart';
import '../models/paypal_transaction_model.dart';
import '../state/checkout_state.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPayPal = false;

  onChangePaymentType({required int index}) {
    if (index == 1) {
      isPayPal = true;
    } else {
      isPayPal = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutBloc, CheckoutState>(
      listener: (context, state) {
        if (state is CheckoutError) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else if (state is CheckoutSuccess) {
          Navigator.pop(context);
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SuccessPaymentView()));
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PaymentMethodsList(
                  onChangePayment: onChangePaymentType,
                ),
                SizedBox(
                  height: 32,
                ),
                CustomButton(
                  onTap: () {
                    if (isPayPal == true) {
                      var transaction = getTransactions();
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => PaypalCheckoutView(
                          sandboxMode: true,
                          clientId: ApiKeys.payPalClientId,
                          secretKey: ApiKeys.payPalSecretKey,
                          transactions: [
                            {
                              "amount": transaction.amount.toJson(),
                              "description": "The payment transaction description.",
                              "item_list": transaction.itemsList.toJson(),
                            }
                          ],
                          note: "Contact us for any questions on your order.",
                          onSuccess: (Map params) async {
                            print("onSuccess: $params");
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SuccessPaymentView()));
                          },
                          onError: (error) {
                            print("onError: $error");
                            Navigator.pop(context);
                            SnackBar snackBar = SnackBar(content: Text(error.toString()));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                          onCancel: () {
                            print('cancelled:');
                            Navigator.pop(context);
                          },
                        ),
                      ));
                    } else {
                      PaymentIntentInputModel model = PaymentIntentInputModel(
                        amount: "100",
                        currency: "USD",
                        customerId: ApiKeys.demoCustomerKey,
                      );
                      BlocProvider.of<CheckoutBloc>(context)
                          .add(Click(arguments: model));
                    }
                  },
                  loading: state is CheckoutLoading,
                  text: "Continue",
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ({AmountModel amount, ItemListModel itemsList}) getTransactions() {
    /// Amount model
    AmountModel amount = AmountModel(
      total: "70",
      currency: "USD",
      details: AmountDetailsModel(
        subtotal: "70",
        shipping: "0",
        shippingDiscount: 0,
      ),
    );

    /// Item List model
    List<OrderItemModel> orders = [
      OrderItemModel(
        name: "Apple",
        quantity: 4,
        price: "5",
        currency: "USD",
      ),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: "10",
        currency: "USD",
      ),
    ];
    ItemListModel itemsList = ItemListModel(orders: orders);

    return (amount: amount, itemsList: itemsList);
  }
}
