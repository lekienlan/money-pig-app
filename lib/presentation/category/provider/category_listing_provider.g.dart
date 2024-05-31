// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_listing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryListingNotifierHash() =>
    r'ed9a8ac17647eeee1d3e44fb344291c8dbaeff33';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$CategoryListingNotifier
    extends BuildlessAutoDisposeNotifier<CategoryListingState> {
  late final CategoryParams params;

  CategoryListingState build(
    CategoryParams params,
  );
}

/// See also [CategoryListingNotifier].
@ProviderFor(CategoryListingNotifier)
const categoryListingNotifierProvider = CategoryListingNotifierFamily();

/// See also [CategoryListingNotifier].
class CategoryListingNotifierFamily extends Family<CategoryListingState> {
  /// See also [CategoryListingNotifier].
  const CategoryListingNotifierFamily();

  /// See also [CategoryListingNotifier].
  CategoryListingNotifierProvider call(
    CategoryParams params,
  ) {
    return CategoryListingNotifierProvider(
      params,
    );
  }

  @override
  CategoryListingNotifierProvider getProviderOverride(
    covariant CategoryListingNotifierProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'categoryListingNotifierProvider';
}

/// See also [CategoryListingNotifier].
class CategoryListingNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CategoryListingNotifier, CategoryListingState> {
  /// See also [CategoryListingNotifier].
  CategoryListingNotifierProvider(
    CategoryParams params,
  ) : this._internal(
          () => CategoryListingNotifier()..params = params,
          from: categoryListingNotifierProvider,
          name: r'categoryListingNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryListingNotifierHash,
          dependencies: CategoryListingNotifierFamily._dependencies,
          allTransitiveDependencies:
              CategoryListingNotifierFamily._allTransitiveDependencies,
          params: params,
        );

  CategoryListingNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final CategoryParams params;

  @override
  CategoryListingState runNotifierBuild(
    covariant CategoryListingNotifier notifier,
  ) {
    return notifier.build(
      params,
    );
  }

  @override
  Override overrideWith(CategoryListingNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryListingNotifierProvider._internal(
        () => create()..params = params,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CategoryListingNotifier,
      CategoryListingState> createElement() {
    return _CategoryListingNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryListingNotifierProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryListingNotifierRef
    on AutoDisposeNotifierProviderRef<CategoryListingState> {
  /// The parameter `params` of this provider.
  CategoryParams get params;
}

class _CategoryListingNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CategoryListingNotifier,
        CategoryListingState> with CategoryListingNotifierRef {
  _CategoryListingNotifierProviderElement(super.provider);

  @override
  CategoryParams get params =>
      (origin as CategoryListingNotifierProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
