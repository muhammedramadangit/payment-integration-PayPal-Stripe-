import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/styles.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard(
      {super.key, this.isActive = false, required this.image});

  final bool isActive;
  final String image;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      height: 60,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              color: isActive == true ? Styles.PRIMARY_COLOR : Colors.grey,
              width: 2),
        ),
        shadows: [
          BoxShadow(
            color: isActive == true ? Styles.PRIMARY_COLOR : Colors.white,
            spreadRadius: 0,
            offset: Offset(0, 0),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: SvgPicture.asset(image),
      ),
    );
  }
}
