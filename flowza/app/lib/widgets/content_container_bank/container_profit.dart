import 'package:flowza/theme/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContainerProfit extends StatelessWidget {
  const ContainerProfit({super.key, required this.profit, required this.text});
  final int profit;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: ColorsApp.titleColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.backGroundColor,
              ),
            ),
            Text(
              NumberFormat('#,##0').format(profit),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.backGroundColor,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorsApp.backGroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
