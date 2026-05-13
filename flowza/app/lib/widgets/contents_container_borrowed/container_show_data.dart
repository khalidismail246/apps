import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/widgets/contents_container_borrowed/amount_container.dart';
import 'package:flowza/widgets/contents_container_borrowed/date_container.dart';
import 'package:flowza/widgets/contents_container_borrowed/delete_button.dart';
import 'package:flowza/widgets/contents_container_borrowed/icon_and_name.dart';
import 'package:flowza/widgets/contents_container_borrowed/paid_status_button.dart';
import 'package:flutter/material.dart';

class ContainerShowData extends StatelessWidget {
  const ContainerShowData({
    super.key,
    required this.name,
    required this.amount,
    required this.currency,
    required this.isPaid,
    required this.date1,
    required this.date2,
    required this.onDelete,
    required this.onTogglePaid,
    required this.typeMoney,
  });
  final String name;
  final int amount;
  final String currency;
  final bool isPaid;
  final DateTime date1;
  final DateTime date2;
  final VoidCallback onDelete;
  final VoidCallback onTogglePaid;
  final String typeMoney;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isPaid
            ? ColorsApp.appColor.withValues(alpha: .2)
            : Colors.red.withValues(alpha: .2),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconAndName(
                      isPaid: isPaid,
                      name: name,
                      icon: Icon(
                        Icons.person_outline,
                        color: isPaid ? ColorsApp.backGroundColor : Colors.red,
                      ),
                    ),
                    const SizedBox(height: 5),
                    AmountContainer(amount: amount, currency: currency),
                    SizedBox(height: 8),
                    DateContainer(
                      borrowedDate: date1,
                      returnDate: date2,
                      textStart: typeMoney,
                      textEnd: "RETURN DATE",
                    ),
                    const Divider(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DeleteButton(
                          onPressed: () {
                            onDelete();
                          },
                        ),
                        PaidStatusButton(
                          isPaid: isPaid,
                          onTap: () {
                            onTogglePaid();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: isPaid ? ColorsApp.textColor : Colors.red,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
