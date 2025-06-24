import 'package:checkout_payment/features/payment_details/widgets/payment_methods_list.dart';
import 'package:checkout_payment/main_widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PaymentMethodsList(),
            SizedBox(height: 32,),
            CustomButton(
              text: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
