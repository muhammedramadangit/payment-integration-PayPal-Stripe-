import 'package:checkout_payment/features/cart/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_payment/main_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../helper/text_styles.dart';
import '../widgets/cart_summary.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My cart",
          style: AppTextStyles.w700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(child: Image.asset("assets/images/cart.png")),
            SizedBox(height: 24),
            Summary(name: "Order Subtotal", value: r"$42.97"),
            SizedBox(height: 3),
            Summary(name: "Discount", value: r"$0"),
            SizedBox(height: 3),
            Summary(name: "Shipping", value: r"$8"),
            Divider(height: 34),
            Summary(name: "Total", value: r"$50.97", isBold: true),
            CustomButton(
              text: "Complete Payment",
              padding: EdgeInsets.symmetric(vertical: 20),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (_) => PaymentDetailsView()));
                showModalBottomSheet(
                  context: context,
                  barrierColor: Colors.black54,
                  enableDrag: true,
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  builder: (context) {
                    return PaymentMethodsBottomSheet();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
