import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../helper/text_styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/svg/master.svg"),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Credit Card",
                  style: AppTextStyles.w500.copyWith(fontSize: 18),
                ),
                Text(
                  "Mastercard **78",
                  style: AppTextStyles.w500.copyWith(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
