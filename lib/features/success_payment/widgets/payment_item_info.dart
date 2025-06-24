import 'package:flutter/material.dart';

import '../../../helper/text_styles.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo(
      {super.key,
        required this.name,
        required this.value,
        this.isBold = false});

  final String name, value;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: AppTextStyles.w500.copyWith(
              fontSize: isBold == true ? 25 : 18,
              fontWeight: isBold == true ? FontWeight.w700 : FontWeight.w500
          ),
        ),
        Text(
          value,
          style: AppTextStyles.w700.copyWith(
              fontSize: isBold == true ? 25   : 18,
              fontWeight: isBold == true ? FontWeight.w700 : FontWeight.w500
          ),
        ),
      ],
    );
  }
}
