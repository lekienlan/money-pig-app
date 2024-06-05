import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/domain/model/style_model.dart';
import 'package:money_pig/presentation/category_input/provider/category_input_provider.dart';
import 'package:money_pig/presentation/category_listing/widget/category_item_widget.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/widget/header_widget.dart';

class CategoryInputPage extends ConsumerStatefulWidget {
  final TransactionTypeEnum? type;
  const CategoryInputPage({super.key, this.type});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IncomeInputPageState();
}

class _IncomeInputPageState extends ConsumerState<CategoryInputPage> {
  TextEditingController nameController = TextEditingController();
  double _baseWidth = 50;
  double _maxWidth = 200;

  @override
  Widget build(BuildContext context) {
    double calculatedWidth =
        _baseWidth + (nameController.text.length * 7).toDouble();
    double textFieldWidth = calculatedWidth.clamp(_baseWidth, _maxWidth);
    final categoryInputNotifier = ref.watch(categoryInputNotifierProvider);

    return Scaffold(
      appBar: HeaderWidget(title: 'category'.tr().capitalize()),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            IntrinsicWidth(
                child: CategoryItemWidget(
              icon: categoryInputNotifier.icon,
              onChangeIcon: (key, _) {
                ref
                    .read(categoryInputNotifierProvider.notifier)
                    .onChangeIcon(key);
              },
              isSelected: true,
              category: CategoryModel(
                type: widget.type,
              ),
              customWidget: Container(
                width: textFieldWidth,
                child: Center(
                    child: TextField(
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyM(
                    color: widget.type == TransactionTypeEnum.expense
                        ? ColorName.orange500
                        : ColorName.green500,
                  ),
                  decoration: InputDecoration(
                      hintText: '...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: 12, // HERE THE IMPORTANT PART
                      )),
                  onChanged: (value) {
                    setState(() {
                      String text = sanitizeText(value);

                      ref
                          .read(categoryInputNotifierProvider.notifier)
                          .onChangeName(text);
                      nameController.text = text;
                    });
                  },
                  autofocus: true,
                )),
              ),
            )),
            Spacer(),
            ElevatedButton(
                onPressed: isTruthy(categoryInputNotifier.name)
                    ? () async {
                        await ref
                            .read(categoryInputNotifierProvider.notifier)
                            .onComplete(
                                name: categoryInputNotifier.name,
                                type: widget.type,
                                style: StyleModel(
                                  icon: categoryInputNotifier.icon,
                                ));
                        ref.read(routerProvider).pop();
                      }
                    : null,
                child: Text(
                  "${'create'.tr().capitalize()} ${'category'.tr()}",
                )),
          ],
        ),
      ),
    );
  }
}
