import 'package:checkout_payment/main_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../helper/text_styles.dart';
import '../../success_payment/view/success_payment_view.dart';
import '../widgets/custom_credit_card.dart';
import '../widgets/payment_methods_list.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment details",
          style: AppTextStyles.w700,
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: PaymentMethodsList()),
            SliverToBoxAdapter(
                child: CustomCreditCard(
              autoValidateMode: autoValidateMode,
              formKey: formKey,
            )),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => SuccessPaymentView()));
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
