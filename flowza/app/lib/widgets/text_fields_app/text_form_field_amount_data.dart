import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flowza/widgets/drop_down_currency_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TextFormFieldAmountData extends StatefulWidget {
  const TextFormFieldAmountData({
    super.key,
    required this.label,
    required this.validator,
    required this.onChanged,
  });
  final String label;
  final String? Function(String?)? validator;
  final Function(int amount, String currency) onChanged;

  @override
  State<TextFormFieldAmountData> createState() =>
      _TextFormFieldAmountDataState();
}

class _TextFormFieldAmountDataState extends State<TextFormFieldAmountData> {
  final TextEditingController controller = TextEditingController();
  String selectedCurrency = "USD";

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            onSaved: (value) {
              final cleanValue = value!.replaceAll(",", "");
              final number = int.tryParse(cleanValue);
              if (number != null) {
                widget.onChanged(number, selectedCurrency);
              }
            },
            validator: widget.validator,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              ThousandsFormatter(),
            ],
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: TextStyleApp.bold15(ColorsApp.backGroundColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: ColorsApp.backGroundColor,
                  width: 2,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
            ),
          ),
        ),
        DropDownCurrencyButton(
          onChanged: (String currency) {
            setState(() {
              selectedCurrency = currency;
            });
            controller.clear();
          },
        ),
      ],
    );
  }
}

class ThousandsFormatter extends TextInputFormatter {
  final NumberFormat _format = NumberFormat("#,###");
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll(",", "");
    if (text.isEmpty) {
      return newValue.copyWith(text: '');
    }
    final number = int.tryParse(text);
    if (number == null) return oldValue;
    final formatted = _format.format(number);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
