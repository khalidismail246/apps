import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyleApp.extraBold24(ColorsApp.backGroundColor)),
        Text(subTitle, style: TextStyleApp.light16(Colors.grey)),
      ],
    );
  }
}
