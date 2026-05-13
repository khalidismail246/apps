import 'package:flowza/theme/colors_app.dart';
import 'package:flutter/material.dart';

class PaidStatusButton extends StatelessWidget {
  final bool isPaid;
  final VoidCallback onTap;

  const PaidStatusButton({
    super.key,
    required this.isPaid,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final color = isPaid ? ColorsApp.textColor : Colors.red;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isPaid
              ? ColorsApp.textColor.withValues(alpha: .2)
              : Colors.red.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isPaid ? Icons.check_circle : Icons.cancel,
              size: 16,
              color: color,
            ),
            const SizedBox(width: 5),
            Text(
              isPaid ? "Paid" : "Not Paid",
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
