import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2,
          left: -20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2,
          right: -20,
          child: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.2 + 20,
          left: 28,
          right: 28,
          child: Row(
            children: List.generate(
              30,
              (index) {
                return Expanded(
                  child: Container(
                    height: 3,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffb8b8b8)),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
