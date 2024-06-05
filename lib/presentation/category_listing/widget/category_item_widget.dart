import 'package:flutter/material.dart';
import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/util/icon_mapper.dart';
import 'package:money_pig/shared/widget/icon_select_widget.dart';
import 'package:remixicon/remixicon.dart';

class CategoryItemWidget extends StatelessWidget {
  final Color? color;
  final CategoryModel? category;
  final bool? isSelected;
  final void Function()? onTap;
  final void Function(String? key, IconData? icon)? onChangeIcon;
  final Widget? customWidget;
  final String? icon;

  const CategoryItemWidget({
    this.icon,
    this.onTap,
    this.color,
    this.category,
    this.isSelected,
    this.customWidget,
    this.onChangeIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color? _genColor() {
      if (isTruthy(color)) return color;
      if (category?.type == TransactionTypeEnum.budget ||
          category?.type == TransactionTypeEnum.income)
        return ColorName.green500;
      if (category?.type == TransactionTypeEnum.expense)
        return ColorName.orange500;

      return null;
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        height: 40,
        duration: Duration(milliseconds: 100), // Adjust the duration as needed
        decoration: BoxDecoration(
          border: isTruthy(isSelected)
              ? Border.all(
                  color: _genColor() ?? ColorName.textBorder,
                )
              : Border.all(
                  color: ColorName.white,
                ),
          color: isTruthy(isSelected)
              ? _genColor()?.withOpacity(0.1)
              : ColorName.white,
          borderRadius: BorderRadius.circular(100),
        ),
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: Row(
          children: [
            AnimatedContainer(
              duration:
                  Duration(milliseconds: 300), // Adjust the duration as needed
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isTruthy(isSelected)
                    ? _genColor()
                    : ColorName.textSecondary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconSelectWidget(
                onChange: onChangeIcon,
                icon: IconMapper.iconList[category?.style?.icon ?? icon] ??
                    Remix.drinks_2_fill,
              ),
            ),
            if (isTruthy(customWidget))
              customWidget!
            else
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  category?.name ?? '',
                  style: AppTextStyle.bodyM(
                    color: isTruthy(isSelected) ? _genColor() : null,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
