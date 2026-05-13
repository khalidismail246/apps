import 'package:flowza/models/bank/bank_model.dart';
import 'package:flowza/theme/colors_app.dart';
import 'package:flowza/theme/text_style_app.dart';
import 'package:flowza/widgets/content_container_bank/benefit_container.dart';
import 'package:flowza/widgets/content_container_bank/container_profit.dart';
import 'package:flowza/widgets/contents_container_borrowed/amount_container.dart';
import 'package:flowza/widgets/contents_container_borrowed/date_container.dart';
import 'package:flowza/widgets/contents_container_borrowed/delete_button.dart';
import 'package:flowza/widgets/contents_container_borrowed/icon_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerShowDataBank extends StatelessWidget {
  const ContainerShowDataBank({
    super.key,
    required this.bankModel,
    required this.onDelete,
  });
  final BankModel bankModel;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    bool isEnded = bankModel.endDate.isBefore(DateTime.now());
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isEnded
            ? Colors.red.withValues(alpha: .2)
            : ColorsApp.appColor.withValues(alpha: .2),
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
                      isPaid: isEnded,
                      name: bankModel.name,
                      icon: SvgPicture.asset("assets/images/bank.svg"),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 30,
                      children: [
                        AmountContainer(
                          amount: bankModel.money,
                          currency: bankModel.currency,
                        ),
                        BenefitContainer(benefit: bankModel.benefit),
                      ],
                    ),
                    SizedBox(height: 8),
                    Center(
                      child: Text(
                        bankModel.certificateType,
                        style: TextStyleApp.bold15(ColorsApp.backGroundColor),
                      ),
                    ),

                    ContainerProfit(
                      profit: bankModel.profit,
                      text: bankModel.certificateType,
                    ),

                    DateContainer(
                      borrowedDate: bankModel.startDate,
                      returnDate: bankModel.endDate,
                      textStart: 'START DATE',
                      textEnd: 'END DATE',
                    ),
                    SizedBox(height: 5),
                    Divider(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DeleteButton(onPressed: onDelete),
                        if (isEnded)
                          Text("Ended", style: TextStyleApp.bold15(Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: isEnded ? Colors.red : ColorsApp.appColor,
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
