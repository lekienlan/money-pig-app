import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_icon_widget.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';

class BudgetExpenseButtonWidget extends StatelessWidget {
  final String title;
  final num? amount;
  final Color color;
  final IconData icon;

  BudgetExpenseButtonWidget({
    required this.title,
    required this.amount,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [AppShadow.light],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.tr().capitalize(),
                style: AppTextStyle.bodyS(
                  color: AppColor.textTertiary,
                ),
              ),
              TransactionIconWidget(
                iconColor: color,
                icon: icon,
                rotation: 0.75,
              ),
            ],
          ),
          Text(
            formatCurrency(amount),
            style: AppTextStyle.headingXS(color: color),
          ),
        ],
      ),
    );
  }
}
