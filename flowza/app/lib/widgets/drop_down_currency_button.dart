import 'package:flutter/material.dart';

class DropDownCurrencyButton extends StatefulWidget {
  const DropDownCurrencyButton({super.key, required this.onChanged});
  final Function(String currency) onChanged;

  @override
  State<DropDownCurrencyButton> createState() => _DropDownCurrencyButtonState();
}

class _DropDownCurrencyButtonState extends State<DropDownCurrencyButton> {
  String selectedCurrency = "USD";
  @override
  Widget build(BuildContext context) {
    List<String> currencies = ["USD", "EUR", "SAR", "AED", "EGP", "QAR", "KWD"];
    return DropdownButton<String>(
      value: selectedCurrency,
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
    );
  }
}
