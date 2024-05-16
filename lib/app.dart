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
            onPrimary: ColorName.primaryDark,
            secondary: ColorName.primaryLight,
            onSecondary: ColorName.textSecondary,
            error: ColorName.pink700,
            onError: ColorName.textSecondary,
            background: ColorName.surfaceSecondary,
            onBackground: ColorName.textSecondary,
            surface: ColorName.white,
            onSurface: ColorName.textSecondary,
          ),
          fontFamily: FontFamily.inter,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return ColorName.primaryDark;
                }

                if (states.contains(MaterialState.disabled)) {
                  return ColorName.textDisabled;
                }
                return ColorName.primaryMain;
              },
            ),
            textStyle: MaterialStateProperty.all<TextStyle>(
              AppTextStyle.headingXS(color: ColorName.white),
            ),
            foregroundColor: MaterialStatePropertyAll(ColorName.white),
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            elevation: MaterialStatePropertyAll(0),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 40), // Adjust the height as needed
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              AppTextStyle.bodyS(),
            ),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(double.infinity, 32), // Adjust the height as needed
            ),
          )),
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
