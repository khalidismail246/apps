import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    super.key,
    required this.borrowedDate,
    required this.returnDate,
    required this.textStart,
    required this.textEnd,
  });
  final DateTime borrowedDate;
  final DateTime returnDate;
  final String textStart;
  final String textEnd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textStart, style: TextStyleApp.bold12(ColorsApp.titleColor)),

            Text(
              "${borrowedDate.day} / ${borrowedDate.month} / ${borrowedDate.year}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(textEnd, style: TextStyleApp.bold12(ColorsApp.titleColor)),

            Text(
              "${returnDate.day} / ${returnDate.month} / ${returnDate.year}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
