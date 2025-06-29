import 'package:checkout_payment/features/payment_details/widgets/payment_method_card.dart';
import 'package:flutter/material.dart';

class PaymentMethodsList extends StatefulWidget {
  const PaymentMethodsList({super.key, required this.onChangePayment});

  final Function({required int index}) onChangePayment;
  @override
  State<PaymentMethodsList> createState() => _PaymentMethodsListState();
}

class _PaymentMethodsListState extends State<PaymentMethodsList> {
  List<String> paymentMethods = [
    "assets/svg/card.svg",
    "assets/svg/paypal.svg",
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemCount: paymentMethods.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
              widget.onChangePayment(index: currentIndex);
            },
            child: PaymentMethodCard(
              isActive: currentIndex == index,
              image: paymentMethods[index],
            ),
          );
        },
      ),
    );
  }
}
