import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:remixicon/remixicon.dart';

class NavigationBarWidget extends ConsumerWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    _getCurrentIndex() {
      final uri = router.routeInformationProvider.value.uri.toString();
      switch (uri) {
        case CategoryListingRoute.path:
          return 1;
      }

      return 0;
    }

    _onTap(int index) {
      switch (index) {
        case 0:
          ref.read(routerProvider).go(HomeRoute.path);
        case 1:
          ref.read(routerProvider).go(CategoryListingRoute.path);
      }
    }

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
              selectedItemColor: AppColor.primaryMain,
              unselectedItemColor: AppColor.primaryExtraLight,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              currentIndex: _getCurrentIndex(),
              selectedFontSize: 0,
              unselectedFontSize: 0,
              iconSize: 24,
              backgroundColor: AppColor.surfaceBrandLight,
              onTap: _onTap,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Remix.home_5_line), label: ''),
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
