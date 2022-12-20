import 'package:flutter/material.dart';

import '../constants.dart';

class AmountAndFilter extends StatelessWidget {
  const AmountAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "3,600 USD",
            style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Constants.softHighlightColor, offset: const Offset(-10, -10), spreadRadius: 0, blurRadius: 10),
                BoxShadow(color: Constants.softShadowColor, offset: const Offset(10, 10), spreadRadius: 0, blurRadius: 10)
              ],
              gradient: const LinearGradient(colors: [Constants.gradientStart, Constants.gradientMiddle, Constants.gradientEnd])),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
            child: Text(
              "Filter By",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  shadows: [Shadow(color: Colors.black45, blurRadius: 1)],
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ],
    );
  }
}
