import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flowza/widgets/text_fields_app/text_form_field_amount_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldAmount extends StatelessWidget {
  const TextFormFieldAmount({
    super.key,
    required this.validator,
    required this.onSaved,
    required this.label,
  });
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        ThousandsFormatter(),
      ],
      decoration: InputDecoration(
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
