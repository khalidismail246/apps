import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContainerTotalBank extends StatefulWidget {
  const ContainerTotalBank({
    super.key,
    required this.total,
    required this.title,
  });

  final String title;
  final Map<String, int> total;

  @override
  State<ContainerTotalBank> createState() => _ContainerTotalState();
}

class _ContainerTotalState extends State<ContainerTotalBank> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorsApp.backGroundColor,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyleApp.medium16(ColorsApp.textColor),
              ),
              const SizedBox(width: 10),

              IconButton(
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                icon: Icon(
                  isHidden ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          Column(
            children: widget.total.entries.map((entry) {
              return Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isHidden
                        ? '******'
                        : NumberFormat('#,###').format(entry.value),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    entry.key,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
