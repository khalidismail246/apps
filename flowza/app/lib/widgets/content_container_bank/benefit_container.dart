import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';

class BenefitContainer extends StatelessWidget {
  const BenefitContainer({super.key, required this.benefit});
  final double benefit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Benefit", style: TextStyleApp.bold12(ColorsApp.titleColor)),

        Text(
          "${_formatNumber(benefit)} %",
          style: TextStyleApp.bold15(ColorsApp.backGroundColor),
        ),
      ],
    );
  }

  String _formatNumber(double number) {
    if (number == number.toInt()) {
      return number.toInt().toString();
    } else {
      return number.toString();
    }
  }
}
