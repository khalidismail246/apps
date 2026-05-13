import 'package:flutter/material.dart';

class DropButtonTypeOfBankCertificate extends StatefulWidget {
  const DropButtonTypeOfBankCertificate({super.key, required this.onChanged});
  final Function(String type) onChanged;

  @override
  State<DropButtonTypeOfBankCertificate> createState() =>
      _DropButtonTypeOfBankCertificateState();
}

class _DropButtonTypeOfBankCertificateState
    extends State<DropButtonTypeOfBankCertificate> {
  String selectedValue = "monthly";
  @override
  Widget build(BuildContext context) {
    List<String> typeCertificateBank = ["monthly", "yearly"];
    return DropdownButton<String>(
      value: selectedValue,
      items: typeCertificateBank
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value!;
          widget.onChanged(selectedValue);
        });
      },
    );
  }
}
