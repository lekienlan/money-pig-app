// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $homeRoute,
      $newPigRoute,
      $newTransactionRoute,
      $pigDetailRoute,
      $eastlinRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $newPigRoute => GoRouteData.$route(
      path: '/new-pig',
      factory: $NewPigRouteExtension._fromState,
    );

extension $NewPigRouteExtension on NewPigRoute {
  static NewPigRoute _fromState(GoRouterState state) => const NewPigRoute();

  String get location => GoRouteData.$location(
        '/new-pig',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $newTransactionRoute => GoRouteData.$route(
      path: '/transaction/new',
      factory: $NewTransactionRouteExtension._fromState,
    );

extension $NewTransactionRouteExtension on NewTransactionRoute {
  static NewTransactionRoute _fromState(GoRouterState state) =>
      const NewTransactionRoute();

  String get location => GoRouteData.$location(
        '/transaction/new',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $pigDetailRoute => GoRouteData.$route(
      path: '/new-pig/:id',
      factory: $PigDetailRouteExtension._fromState,
    );

extension $PigDetailRouteExtension on PigDetailRoute {
  static PigDetailRoute _fromState(GoRouterState state) => PigDetailRoute(
        id: state.pathParameters['id']! ?? '',
      );

  String get location => GoRouteData.$location(
        '/new-pig/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $eastlinRoute => GoRouteData.$route(
      path: '/eastlin',
      factory: $EastlinRouteExtension._fromState,
    );

extension $EastlinRouteExtension on EastlinRoute {
  static EastlinRoute _fromState(GoRouterState state) => const EastlinRoute();

  String get location => GoRouteData.$location(
        '/eastlin',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routerHash() => r'1e3504b868996462b85ba592df8b7a551851c97f';

/// See also [router].
@ProviderFor(router)
final routerProvider = AutoDisposeProvider<GoRouter>.internal(
  router,
  name: r'routerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$routerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RouterRef = AutoDisposeProviderRef<GoRouter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
