import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_color.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/fonts.gen.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
          splashColor: AppColor.neutral100,
          colorScheme: ColorScheme(
            primary: AppColor.primaryMain,
            brightness: Brightness.light,
            onPrimary: AppColor.neutral100,
            secondary: AppColor.primaryLight,
            onSecondary: AppColor.textSecondary,
            error: AppColor.pink700,
            onError: AppColor.textSecondary,
            surface: AppColor.surfaceSecondary,
            onSurface: AppColor.textSecondary,
          ),
          fontFamily: FontFamily.inter,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColor.primaryDark;
                }

                if (states.contains(WidgetState.disabled)) {
                  return AppColor.textDisabled;
                }
                return AppColor.primaryMain;
              },
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              AppTextStyle.headingXS(color: AppColor.white),
            ),
            foregroundColor: WidgetStatePropertyAll(AppColor.white),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            elevation: WidgetStatePropertyAll(0),
            minimumSize: WidgetStateProperty.all<Size>(
              Size(double.infinity, 40), // Adjust the height as needed
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            textStyle: WidgetStateProperty.all<TextStyle>(
              AppTextStyle.bodyS(),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            minimumSize: WidgetStateProperty.all<Size>(
              Size(double.infinity, 32), // Adjust the height as needed
            ),
          )),
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: AppColor.textSecondary),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: AppColor.textDisabled))),
      routerConfig: router,
      builder: (context, router) {
        return Material(
          child: router,
        );
      },
    );
  }
}
