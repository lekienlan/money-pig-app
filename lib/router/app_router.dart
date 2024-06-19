// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:money_pig/presentation/category_input/widget/category_input_page.dart';
import 'package:money_pig/presentation/category_listing/widget/category_listing_page.dart';
import 'package:money_pig/presentation/eastlin/widget/eastlin_page.dart';
import 'package:money_pig/presentation/home/widget/home_page.dart';
import 'package:money_pig/presentation/income_listing/widget/income_listing_page.dart';
import 'package:money_pig/presentation/new_pig/widget/new_pig_page.dart';
import 'package:money_pig/presentation/pig_detail/widget/pig_detail_page.dart';
import 'package:money_pig/presentation/splash/widget/splash_page.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_input_page.dart';
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
  Page buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const HomePage(),
      key: ValueKey(state.fullPath),
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

@TypedGoRoute<NewPigRoute>(path: NewPigRoute.path)
class NewPigRoute extends GoRouteData {
  const NewPigRoute();

  static const path = '/new-pig';

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return BottomSheetPage(
        builder: (_) => ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              child: NewPigPage(),
              key: ValueKey(state.fullPath),
            ));
  }
}

@TypedGoRoute<TransactionInputRoute>(path: TransactionInputRoute.path)
class TransactionInputRoute extends GoRouteData {
  final TransactionTypeEnum type;
  final String? periodId;
  const TransactionInputRoute({required this.type, this.periodId});

  static const path = '/transaction-input';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return BottomSheetPage(
      builder: (_) => ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          child: TransactionInputPage(type: type, periodId: periodId)),
    );
  }
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

  // @override
  // Page buildPage(BuildContext context, GoRouterState state) {
  //   return CupertinoPage(
  //     child: PigDetailPage(id: id),
  //     key: ValueKey(state.fullPath),
  //   );
  // }
}

@TypedGoRoute<CategoryListingRoute>(path: CategoryListingRoute.path)
class CategoryListingRoute extends GoRouteData {
  const CategoryListingRoute();

  static const path = '/category-listing';

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      child: const CategoryListingPage(),
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

@TypedGoRoute<IncomeListingRoute>(path: IncomeListingRoute.path)
class IncomeListingRoute extends GoRouteData {
  const IncomeListingRoute();

  static const path = '/income-listing';

  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return BottomSheetPage(
      builder: (_) => ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          child: IncomeListingPage()),
    );
  }
}

@TypedGoRoute<CategoryInputRoute>(path: CategoryInputRoute.path)
class CategoryInputRoute extends GoRouteData {
  final TransactionTypeEnum? type;
  const CategoryInputRoute({this.type});

  static const path = '/category-input';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return BottomSheetPage(
      builder: (_) => ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          child: CategoryInputPage(type: type)),
    );
  }
}

@TypedGoRoute<CategoryDetailRoute>(path: CategoryDetailRoute.path)
class CategoryDetailRoute extends GoRouteData {
  final String id;
  const CategoryDetailRoute({this.id = ''});

  static const path = '/category-detail/:id';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return BottomSheetPage(
      builder: (_) => ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          child: CategoryInputPage(id: id)),
    );
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
