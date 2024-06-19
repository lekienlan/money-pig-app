// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_input_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryInputNotifierHash() =>
    r'192a08882b94b9e13a829fbc025b9b4489c89405';

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

abstract class _$CategoryInputNotifier
    extends BuildlessAutoDisposeNotifier<CategoryInputState> {
  late final String? id;

  CategoryInputState build(
    String? id,
  );
}

/// See also [CategoryInputNotifier].
@ProviderFor(CategoryInputNotifier)
const categoryInputNotifierProvider = CategoryInputNotifierFamily();

/// See also [CategoryInputNotifier].
class CategoryInputNotifierFamily extends Family<CategoryInputState> {
  /// See also [CategoryInputNotifier].
  const CategoryInputNotifierFamily();

  /// See also [CategoryInputNotifier].
  CategoryInputNotifierProvider call(
    String? id,
  ) {
    return CategoryInputNotifierProvider(
      id,
    );
  }

  @override
  CategoryInputNotifierProvider getProviderOverride(
    covariant CategoryInputNotifierProvider provider,
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
  String? get name => r'categoryInputNotifierProvider';
}

/// See also [CategoryInputNotifier].
class CategoryInputNotifierProvider extends AutoDisposeNotifierProviderImpl<
    CategoryInputNotifier, CategoryInputState> {
  /// See also [CategoryInputNotifier].
  CategoryInputNotifierProvider(
    String? id,
  ) : this._internal(
          () => CategoryInputNotifier()..id = id,
          from: categoryInputNotifierProvider,
          name: r'categoryInputNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryInputNotifierHash,
          dependencies: CategoryInputNotifierFamily._dependencies,
          allTransitiveDependencies:
              CategoryInputNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  CategoryInputNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String? id;

  @override
  CategoryInputState runNotifierBuild(
    covariant CategoryInputNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(CategoryInputNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CategoryInputNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<CategoryInputNotifier, CategoryInputState>
      createElement() {
    return _CategoryInputNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryInputNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryInputNotifierRef
    on AutoDisposeNotifierProviderRef<CategoryInputState> {
  /// The parameter `id` of this provider.
  String? get id;
}

class _CategoryInputNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<CategoryInputNotifier,
        CategoryInputState> with CategoryInputNotifierRef {
  _CategoryInputNotifierProviderElement(super.provider);

  @override
  String? get id => (origin as CategoryInputNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
