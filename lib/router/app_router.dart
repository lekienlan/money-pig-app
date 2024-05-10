// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_pig/presentation/eastlin/widget/eastlin_page.dart';
import 'package:money_pig/presentation/home/widget/home_page.dart';
import 'package:money_pig/presentation/new_pig/widget/new_pig_page.dart';

import 'package:money_pig/presentation/splash/widget/splash_page.dart';
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
  Widget build(BuildContext context, GoRouterState state) {
    return NewPigPage();
    // return CustomTransitionPage(
    //   child: const NewPigPage(),
    //   transitionDuration: const Duration(milliseconds: 200),
    //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //     return FadeTransition(
    //       opacity: animation,
    //       child: child,
    //     );
    //   },
    // );
  }
}

@TypedGoRoute<PigDetailRoute>(path: PigDetailRoute.path)
class PigDetailRoute extends GoRouteData {
  final String id;
  const PigDetailRoute({this.id = ''});

  static const path = '/new-pig/:id';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewPigPage(id: id);
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
