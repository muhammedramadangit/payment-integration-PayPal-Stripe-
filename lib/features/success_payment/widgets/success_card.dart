import 'package:checkout_payment/features/success_payment/widgets/payment_item_info.dart';
import 'package:checkout_payment/helper/styles.dart';
import 'package:checkout_payment/helper/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'card_info_widget.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 66, left: 22, right: 22),
      decoration: BoxDecoration(
        color: Color(0xffededed),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            "Thank you!",
            textAlign: TextAlign.center,
            style: AppTextStyles.w700.copyWith(fontSize: 25),
          ),
          Text(
            "Your transaction is successful ",
            textAlign: TextAlign.center,
            style: AppTextStyles.w500.copyWith(fontSize: 20),
          ),
          SizedBox(height: 46),
          PaymentItemInfo(name: "Date", value: "24-06-2025"),
          SizedBox(height: 16),
          PaymentItemInfo(name: "Time", value: "14:32"),
          SizedBox(height: 16),
          PaymentItemInfo(name: "To", value: "Sam Louis"),
          Divider(
            height: 32,
            thickness: 2,
          ),
          PaymentItemInfo(name: "Total", value: r"350$", isBold: true),
          SizedBox(height: 36),
          CardInfoWidget(),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/svg/barcode.svg",
                width: 180,
              ),
              Container(
                height: 60,
                width: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Styles.PRIMARY_COLOR, width: 2),
                ),
                child: Center(
                  child: Text(
                    "PAID",
                    style: AppTextStyles.w600.copyWith(
                      fontSize: 24,
                      color: Styles.PRIMARY_COLOR,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: ((MediaQuery.of(context).size.height * 0.2 + 20) / 2) - 29,
          )
        ],
      ),
    );
  }
}
