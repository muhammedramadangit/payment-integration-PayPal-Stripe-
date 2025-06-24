import 'package:checkout_payment/features/success_payment/widgets/dashed_line.dart';
import 'package:checkout_payment/helper/styles.dart';
import 'package:flutter/material.dart';

import '../widgets/success_card.dart';

class SuccessPaymentView extends StatelessWidget {
  const SuccessPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SuccessCard(),
            DashedLine(),
            Positioned(
              top: -50,
              right: 0,
              left: 0,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xffededed),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Styles.PRIMARY_COLOR,
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
