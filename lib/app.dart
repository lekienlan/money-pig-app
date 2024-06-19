import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
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
          splashColor: ColorName.neutral100,
          colorScheme: ColorScheme(
            primary: ColorName.primaryMain,
            brightness: Brightness.light,
            onPrimary: ColorName.neutral100,
            secondary: ColorName.primaryLight,
            onSecondary: ColorName.textSecondary,
            error: ColorName.pink700,
            onError: ColorName.textSecondary,
            surface: ColorName.surfaceSecondary,
            onSurface: ColorName.textSecondary,
          ),
          fontFamily: FontFamily.inter,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return ColorName.primaryDark;
                }

                if (states.contains(WidgetState.disabled)) {
                  return ColorName.textDisabled;
                }
                return ColorName.primaryMain;
              },
            ),
            textStyle: WidgetStateProperty.all<TextStyle>(
              AppTextStyle.headingXS(color: ColorName.white),
            ),
            foregroundColor: WidgetStatePropertyAll(ColorName.white),
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
              TextSelectionThemeData(cursorColor: ColorName.textSecondary),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle: TextStyle(color: ColorName.textDisabled))),
      routerConfig: router,
      builder: (context, router) {
        return Material(
          child: router,
        );
      },
    );
  }
}
