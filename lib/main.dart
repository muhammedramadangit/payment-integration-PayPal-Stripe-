import 'package:flutter/material.dart';

import 'features/cart/view/cart_view.dart';

void main() {
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "cairo-medium",
      ),
      home: CartView(),
    );
  }
}
