import 'package:flowza/cubits/bank/cubit/bank_cubit.dart';
import 'package:flowza/models/bank/bank_model.dart';
import 'package:flowza/services/notification_services.dart';
import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flowza/widgets/content_container_bank/drop_button_type_of_bank_certificate.dart';
import 'package:flowza/widgets/content_container_bank/text_form_field_amount.dart';
import 'package:flowza/widgets/drop_down_currency_button.dart';
import 'package:flowza/widgets/text_fields_app/show_date.dart';
import 'package:flowza/widgets/text_fields_app/text_form_field_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormatSheetBank extends StatefulWidget {
  const FormatSheetBank({super.key});

  @override
  State<FormatSheetBank> createState() => _FormatSheetBankState();
}

class _FormatSheetBankState extends State<FormatSheetBank> {
  final _formKey = GlobalKey<FormState>();
  String? nameBank;
  int? amount;
  String? typeCertificate = "monthly";
  double? benefit;
  DateTime? startDate;
  DateTime? endDate;
  String currency = "USD";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isNotNullStartDate = true;
  bool isNotNullEndDate = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Bank Certificate",
                style: TextStyleApp.boldItalic20(ColorsApp.textColor),
              ),
              TextFormFieldData(
                textInputType: TextInputType.text,
                label: "Bank Name",
                onsaved: (value) {
                  nameBank = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter bank name";
                  }
                  return null;
                },
              ),
              TextFormFieldAmount(
                label: "Amount",
                onSaved: (value) {
                  final cleanValue = value!.replaceAll(",", "");
                  amount = int.tryParse(cleanValue);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter amount";
                  }
                  return null;
                },
              ),
              Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: TextFormFieldData(
                      textInputType: TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      suffixIcon: Icon(
                        Icons.percent_outlined,
                        color: ColorsApp.backGroundColor,
                      ),
                      label: "Benefit",
                      onsaved: (value) {
                        benefit = double.tryParse(value!);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter benefit";
                        }
                        final number = double.tryParse(value);
                        if (number == null) {
                          return "Please enter a valid number";
                        }
                        if (number < 0 || number > 100) {
                          return "Please enter a number between 0 and 100";
                        }
                        return null;
                      },
                    ),
                  ),
                  DropDownCurrencyButton(
                    onChanged: (String currency) {
                      this.currency = currency;
                    },
                  ),
                  DropButtonTypeOfBankCertificate(
                    onChanged: (String type) {
                      typeCertificate = type;
                    },
                  ),
                ],
              ),
              ShowDate(
                dateType: "Start Certificate Date",
                onDateChanged: (date) {
                  startDate = date;
                },
                notNull: isNotNullStartDate,
              ),
              ShowDate(
                dateType: "End Certificate Date",
                onDateChanged: (date) {
                  endDate = date;
                },
                notNull: isNotNullEndDate,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (startDate == null) {
                      setState(() {
                        isNotNullStartDate = false;
                      });
                      return;
                    }
                    if (endDate == null ||
                        endDate!.isBefore(startDate!) ||
                        endDate!.isAtSameMomentAs(startDate!)) {
                      setState(() {
                        isNotNullEndDate = false;
                      });
                      return;
                    }
                    _formKey.currentState!.save();
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                    final int notificationId = DateTime.now()
                        .microsecondsSinceEpoch
                        .remainder(10000000);
                    context.read<BankCubit>().addBank(
                      BankModel(
                        name: nameBank!,
                        money: amount!,
                        benefit: benefit!,
                        certificateType: typeCertificate!,
                        startDate: startDate!,
                        endDate: endDate!,
                        profit: typeCertificate == "monthly"
                            ? (amount! * (benefit! / 100) / 12).toInt()
                            : (amount! * (benefit! / 100)).toInt(),
                        currency: currency,
                        notificationId: notificationId,
                      ),
                    );
                    NotificationServices.scheduledNotification(
                      id: notificationId,
                      title: "Bank Certificates",
                      body: "Your Bank Certificate Will End",
                      endDate: endDate!,
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                  backgroundColor: ColorsApp.textColor,
                ),
                child: Icon(
                  Icons.check_outlined,
                  color: ColorsApp.backGroundColor,
                  fontWeight: FontWeight.w700,
                  size: 30,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
