import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.text,
    required this.onTap,
    required this.selected,
  });
  final String text;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: selected
                ? ColorsApp.textColor
                : Colors.grey.withValues(alpha: .4),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyleApp.bold18(
                selected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
