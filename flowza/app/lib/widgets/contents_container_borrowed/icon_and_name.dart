import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';

class IconAndName extends StatelessWidget {
  const IconAndName({
    super.key,
    required this.isPaid,
    required this.name,
    required this.icon,
  });
  final bool isPaid;
  final String name;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              name,
              style: TextStyleApp.bold18(ColorsApp.backGroundColor),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isPaid
                ? ColorsApp.titleColor.withValues(alpha: .2)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: icon,
        ),
      ],
    );
  }
}
