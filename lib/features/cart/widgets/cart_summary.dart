import 'package:flutter/cupertino.dart';

import '../../../helper/text_styles.dart';

class Summary extends StatelessWidget {
  const Summary({required this.name, required this.value, this.isBold = false});

  final String name;
  final String value;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: AppTextStyles.w500.copyWith(
            fontSize: isBold == true ? 24 : 18,
            fontWeight: isBold == true ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        Spacer(),
        Text(
          value,
          style: AppTextStyles.w500.copyWith(
            fontSize: isBold == true ? 24 : 18,
            fontWeight: isBold == true ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
