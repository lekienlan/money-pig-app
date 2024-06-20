import 'package:flutter/material.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_icon_widget.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/util/icon_mapper.dart';
import 'package:remixicon/remixicon.dart';

class TransactionRowWidget extends StatelessWidget {
  final TransactionModel? transaction;
  const TransactionRowWidget({
    this.transaction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryIcon =
        IconMapper.iconList[transaction?.category?.style?.icon ?? ''];

    String renderAmount() {
      if (transaction?.type == TransactionTypeEnum.expense)
        return '-${formatCurrency(transaction?.amount)}';
      return '+${formatCurrency(transaction?.amount)}';
    }

    Color getColor() {
      if (transaction?.type == TransactionTypeEnum.expense)
        return AppColor.orange500;
      return AppColor.green500;
    }

    IconData getIcon() {
      if (isTruthy(categoryIcon)) return categoryIcon!;

      if (transaction?.type == TransactionTypeEnum.expense)
        return Remix.arrow_up_line;
      return Remix.arrow_down_line;
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: [AppShadow.normal],
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TransactionIconWidget(
              iconColor: getColor(),
              icon: getIcon(),
              rotation: isTruthy(categoryIcon) ? 0 : 0.75,
            ),
            SizedBox(width: 8),
            Text(
              transaction?.category?.name ?? '',
              style: AppTextStyle.bodyS(color: getColor()),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  renderAmount(),
                  style: AppTextStyle.headingXS(
                    color: getColor(),
                  ),
                ),
                Text(transaction?.note ?? '')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
