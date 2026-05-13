import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';

class TextFormFieldData extends StatelessWidget {
  const TextFormFieldData({
    super.key,
    required this.label,
    required this.onsaved,
    required this.validator,
    required this.textInputType,
    this.suffixIcon,
  });
  final String label;
  final void Function(String?)? onsaved;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: textInputType,
      validator: validator,
      onSaved: onsaved,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: TextStyleApp.bold15(ColorsApp.backGroundColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ColorsApp.backGroundColor, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
