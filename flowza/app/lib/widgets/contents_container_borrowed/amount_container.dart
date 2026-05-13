import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AmountContainer extends StatelessWidget {
  const AmountContainer({
    super.key,
    required this.amount,
    required this.currency,
  });
  final int amount;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("AMOUNT", style: TextStyleApp.bold12(ColorsApp.titleColor)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 5,
            children: [
              Text(
                NumberFormat('#,##0').format(amount),
                style: TextStyleApp.bold15(Colors.red),
              ),
              Text(
                currency,
                style: TextStyleApp.bold15(ColorsApp.backGroundColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
