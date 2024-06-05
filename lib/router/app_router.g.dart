// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $homeRoute,
      $newPigRoute,
      $transactionInputRoute,
      $pigDetailRoute,
      $categoryListingRoute,
      $incomeListingRoute,
      $categoryInputRoute,
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

RouteBase get $transactionInputRoute => GoRouteData.$route(
      path: '/transaction-input',
      factory: $TransactionInputRouteExtension._fromState,
    );

extension $TransactionInputRouteExtension on TransactionInputRoute {
  static TransactionInputRoute _fromState(GoRouterState state) =>
      TransactionInputRoute(
        type: _$TransactionTypeEnumEnumMap
            ._$fromName(state.uri.queryParameters['type']!),
        periodId: state.uri.queryParameters['period-id'],
      );

  String get location => GoRouteData.$location(
        '/transaction-input',
        queryParams: {
          'type': _$TransactionTypeEnumEnumMap[type],
          if (periodId != null) 'period-id': periodId,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$TransactionTypeEnumEnumMap = {
  TransactionTypeEnum.budget: 'budget',
  TransactionTypeEnum.expense: 'expense',
  TransactionTypeEnum.income: 'income',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

RouteBase get $pigDetailRoute => GoRouteData.$route(
      path: '/pig-detail/:id',
      factory: $PigDetailRouteExtension._fromState,
    );

extension $PigDetailRouteExtension on PigDetailRoute {
  static PigDetailRoute _fromState(GoRouterState state) => PigDetailRoute(
        id: state.pathParameters['id']! ?? '',
      );

  String get location => GoRouteData.$location(
        '/pig-detail/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $categoryListingRoute => GoRouteData.$route(
      path: '/category-listing',
      factory: $CategoryListingRouteExtension._fromState,
    );

extension $CategoryListingRouteExtension on CategoryListingRoute {
  static CategoryListingRoute _fromState(GoRouterState state) =>
      const CategoryListingRoute();

  String get location => GoRouteData.$location(
        '/category-listing',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $incomeListingRoute => GoRouteData.$route(
      path: '/income-listing',
      factory: $IncomeListingRouteExtension._fromState,
    );

extension $IncomeListingRouteExtension on IncomeListingRoute {
  static IncomeListingRoute _fromState(GoRouterState state) =>
      const IncomeListingRoute();

  String get location => GoRouteData.$location(
        '/income-listing',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $categoryInputRoute => GoRouteData.$route(
      path: '/category-input',
      factory: $CategoryInputRouteExtension._fromState,
    );

extension $CategoryInputRouteExtension on CategoryInputRoute {
  static CategoryInputRoute _fromState(GoRouterState state) =>
      CategoryInputRoute(
        type: _$convertMapValue('type', state.uri.queryParameters,
            _$TransactionTypeEnumEnumMap._$fromName),
      );

  String get location => GoRouteData.$location(
        '/category-input',
        queryParams: {
          if (type != null) 'type': _$TransactionTypeEnumEnumMap[type!],
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
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
