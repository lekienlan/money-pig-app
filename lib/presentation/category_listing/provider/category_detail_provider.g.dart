// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryDetailNotifierHash() =>
    r'b873cc4431458704dbebde92dd402341b08d052a';

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

abstract class _$CategoryDetailNotifier
    extends BuildlessAutoDisposeNotifier<CategoryDetailState> {
  late final String id;

  CategoryDetailState build(
    String id,
  );
}

/// See also [CategoryDetailNotifier].
@ProviderFor(CategoryDetailNotifier)
const categoryDetailNotifierProvider = CategoryDetailNotifierFamily();

/// See also [CategoryDetailNotifier].
class CategoryDetailNotifierFamily extends Family<CategoryDetailState> {
  /// See also [CategoryDetailNotifier].
  const CategoryDetailNotifierFamily();

  /// See also [CategoryDetailNotifier].
  CategoryDetailNotifierProvider call(
    String id,
  ) {
    return CategoryDetailNotifierProvider(
      id,
    );
  }

  @override
  CategoryDetailNotifierProvider getProviderOverride(
    covariant CategoryDetailNotifierProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'categoryDetailNotifierProvider';
}

/// See also [CategoryDetailNotifier].
class CategoryDetailNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CategoryDetailNotifier, CategoryDetailState> {
  /// See also [CategoryDetailNotifier].
  CategoryDetailNotifierProvider(
    String id,
  ) : this._internal(
          () => CategoryDetailNotifier()..id = id,
          from: categoryDetailNotifierProvider,
          name: r'categoryDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryDetailNotifierHash,
          dependencies: CategoryDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              CategoryDetailNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  CategoryDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  CategoryDetailState runNotifierBuild(
    covariant CategoryDetailNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(CategoryDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryDetailNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CategoryDetailNotifier,
      CategoryDetailState> createElement() {
    return _CategoryDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryDetailNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryDetailNotifierRef
    on AutoDisposeNotifierProviderRef<CategoryDetailState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CategoryDetailNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CategoryDetailNotifier,
        CategoryDetailState> with CategoryDetailNotifierRef {
  _CategoryDetailNotifierProviderElement(super.provider);

  @override
  String get id => (origin as CategoryDetailNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
