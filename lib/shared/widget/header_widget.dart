import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:remixicon/remixicon.dart';

class HeaderWidget extends ConsumerWidget implements PreferredSizeWidget {
  final String? title;
  final Color? background;
  const HeaderWidget({this.title, this.background, super.key});

  @override
  Size get preferredSize => Size.fromHeight(40.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: background ?? ColorName.white,
      child: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.transparent,
        leadingWidth: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              ref.read(routerProvider).pop();
            },
            child: Icon(
              Remix.arrow_left_line,
              size: 20,
            ),
          ),
        ),
        titleSpacing: 0,
        title: isTruthy(title)
            ? Text(
                title!,
                style: AppTextStyle.headingXS(),
              )
            : null,
      ),
    );
  }
}
