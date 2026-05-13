import 'package:flowza/theme/colors_app.dart';
import 'package:flutter/material.dart';

class ShowDate extends StatefulWidget {
  const ShowDate({
    super.key,
    required this.dateType,
    required this.onDateChanged,
    required this.notNull,
  });
  final Function(DateTime) onDateChanged;
  final String dateType;
  final bool notNull;
  @override
  State<ShowDate> createState() => _ShowDateState();
}

class _ShowDateState extends State<ShowDate> {
  DateTime? selectedDate;
  Future<void> pickdate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2005),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickdate();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.notNull
              ? ColorsApp.backGroundColor.withValues(alpha: .2)
              : Colors.red.withValues(alpha: .2),
        ),
        child: Text(
          selectedDate == null
              ? widget.dateType
              : "${widget.dateType} : ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
        ),
      ),
    );
  }
}
