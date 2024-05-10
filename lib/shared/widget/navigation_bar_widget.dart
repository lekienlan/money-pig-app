import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:remixicon/remixicon.dart';

class NavigationBarWidget extends ConsumerWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        height: 54,
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 8),
        decoration: BoxDecoration(
          boxShadow: [AppShadow.normal],
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorName.textPrimary,
              unselectedItemColor: ColorName.textBorder,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              selectedFontSize: 0,
              unselectedFontSize: 0,
              iconSize: 24,
              backgroundColor: ColorName.white,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Remix.home_5_fill), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Remix.search_2_line), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Remix.heart_line), label: ''),
                BottomNavigationBarItem(
                    icon: Icon(Remix.pie_chart_line), label: ''),
                BottomNavigationBarItem(icon: Icon(Remix.user_line), label: ''),
              ]),
        ),
      ),
    );
  }
}
