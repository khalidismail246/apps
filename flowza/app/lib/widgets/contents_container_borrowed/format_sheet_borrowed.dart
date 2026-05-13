import 'package:flowza/cubits/borrowed/cubit/borrowed_cubit.dart';
import 'package:flowza/cubits/lend/cubit/lend_cubit.dart';
import 'package:flowza/models/borrowed/borrowed_model.dart';
import 'package:flowza/models/land/lend_model.dart';
import 'package:flowza/services/notification_services.dart';
import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flowza/widgets/text_fields_app/show_date.dart';
import 'package:flowza/widgets/text_fields_app/text_form_field_amount_data.dart';
import 'package:flowza/widgets/text_fields_app/text_form_field_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormatSheetBorrowed extends StatefulWidget {
  const FormatSheetBorrowed({super.key, required this.typeMoney});
  final String typeMoney;

  @override
  State<FormatSheetBorrowed> createState() => _FormatSheetBorrowedState();
}

class _FormatSheetBorrowedState extends State<FormatSheetBorrowed> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  int? amount;
  String? currency;
  DateTime? giveMoneyDate;
  DateTime? returnDate;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isNotNullBorrowed = true;
  bool isNotNullreturn = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${widget.typeMoney} Money",
                  style: TextStyleApp.boldItalic20(ColorsApp.textColor),
                ),
                TextFormFieldData(
                  textInputType: TextInputType.text,
                  label: "Name",
                  onsaved: (value) {
                    name = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                ),

                TextFormFieldAmountData(
                  label: "Amount",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your Amount";
                    }
                    return null;
                  },
                  onChanged: (int amount, String currency) {
                    setState(() {
                      this.amount = amount;
                      this.currency = currency;
                    });
                  },
                ),
                ShowDate(
                  notNull: isNotNullBorrowed,
                  dateType: "${widget.typeMoney} Date",
                  onDateChanged: (date) {
                    setState(() {
                      giveMoneyDate = date;
                    });
                  },
                ),
                ShowDate(
                  notNull: isNotNullreturn,
                  dateType: "Return Date",
                  onDateChanged: (date) {
                    setState(() {
                      returnDate = date;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (giveMoneyDate == null) {
                        setState(() {
                          isNotNullBorrowed = false;
                        });
                        return;
                      }
                      if (returnDate == null ||
                          returnDate!.isBefore(giveMoneyDate!) ||
                          returnDate!.isAtSameMomentAs(giveMoneyDate!)) {
                        setState(() {
                          isNotNullreturn = false;
                        });
                        return;
                      }
                      _formKey.currentState!.save();
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      // generate notification id
                      final int notificationId = DateTime.now()
                          .microsecondsSinceEpoch
                          .remainder(10000000);
                      if (widget.typeMoney == "Borrowed") {
                        context.read<BorrowedCubit>().addBorrowed(
                          BorrowedModel(
                            name: name!,
                            amount: amount!,
                            isPaid: false,
                            currency: currency!,
                            borrowedDate: giveMoneyDate!,
                            returnDate: returnDate!,
                            notificationId: notificationId,
                          ),
                        );
                      } else {
                        context.read<LendCubit>().addLend(
                          LendModel(
                            name: name!,
                            amount: amount!,
                            isPaid: false,
                            currency: currency!,
                            lendDate: giveMoneyDate!,
                            returnDate: returnDate!,
                            notificationId: notificationId,
                          ),
                        );
                      }
                      NotificationServices.scheduledNotification(
                        id: notificationId,
                        title: "${widget.typeMoney} Money",
                        body: widget.typeMoney == "Borrowed"
                            ? "Reminder:  you owe $amount $currency to $name"
                            : "Reminder:  $name owes you $amount $currency",
                        endDate: returnDate!,
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
      ),
    );
  }
}
