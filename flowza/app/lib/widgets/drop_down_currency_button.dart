import 'package:flowza/theme/colors_app.dart';
import 'package:flutter/material.dart';

class DropDownCurrencyButton extends StatefulWidget {
  const DropDownCurrencyButton({super.key, required this.onChanged});
  final Function(String currency) onChanged;

  @override
  State<DropDownCurrencyButton> createState() => _DropDownCurrencyButtonState();
}

class _DropDownCurrencyButtonState extends State<DropDownCurrencyButton> {
  String selectedCurrency = "USD";

  final List<String> currencies = [
    "USD",
    "EUR",
    "SAR",
    "AED",
    "EGP",
    "QAR",
    "KWD",
    "BHD",
    "OMR",
    "JOD",
    "IQD",
    "LBP",
    "SYP",
    "TRY",
    "YER",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsApp.backGroundColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          menuMaxHeight: 200,
          value: selectedCurrency,
          icon: const Icon(Icons.arrow_drop_down),
          items: currencies
              .map(
                (currency) =>
                    DropdownMenuItem(value: currency, child: Text(currency)),
              )
              .toList(),

          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedCurrency = value;
              });
              widget.onChanged(value);
            }
          },
        ),
      ),
    );
  }
}
