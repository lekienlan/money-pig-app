// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_pig/presentation/eastlin/widget/eastlin_page.dart';
import 'package:money_pig/presentation/home/widget/home_page.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_input_page.dart';
import 'package:money_pig/presentation/new_pig/widget/new_pig_page.dart';
import 'package:money_pig/presentation/pig_detail/widget/pig_detail_page.dart';

import 'package:money_pig/presentation/splash/widget/splash_page.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/widget/bottom_sheet_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  //final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    // navigatorKey: _key,
    //refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: SplashRoute.path,
    routes: $appRoutes,
    //redirect: notifier.redirect,
  );
}

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<HomeRoute>(path: HomeRoute.path)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<NewPigRoute>(path: NewPigRoute.path)
class NewPigRoute extends GoRouteData {
  const NewPigRoute();

  static const path = '/new-pig';

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    // return NewPigPage();
    return CustomTransitionPage(
      child: const NewPigPage(),
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

@TypedGoRoute<NewTransactionRoute>(path: NewTransactionRoute.path)
class NewTransactionRoute extends GoRouteData {
  final TransactionTypeEnum type;
  final String? periodId;
  const NewTransactionRoute({required this.type, this.periodId});

  static const path = '/transaction-input';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return BottomSheetPage(
      builder: (_) => ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          child: TransactionInputPage(type: type, periodId: periodId)),
    );
  }

  // Method to generate the location string
}

@TypedGoRoute<PigDetailRoute>(path: PigDetailRoute.path)
class PigDetailRoute extends GoRouteData {
  final String id;
  const PigDetailRoute({this.id = ''});

  static const path = '/pig-detail/:id';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PigDetailPage(id: id);
  }
}

@TypedGoRoute<EastlinRoute>(path: EastlinRoute.path)
class EastlinRoute extends GoRouteData {
  const EastlinRoute();

  static const path = '/eastlin';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EastlinPage();
  }
}

class GoNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did push route ${route} : ${previousRoute}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('did pop route ${route} : ${previousRoute}');
  }
}
