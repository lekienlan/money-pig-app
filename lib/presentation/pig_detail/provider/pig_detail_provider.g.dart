// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pig_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pigDetailNotifierHash() => r'4d186cbb8b6988c0d4a2d267edc828124f84239e';

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

abstract class _$PigDetailNotifier
    extends BuildlessAutoDisposeNotifier<PigDetailState> {
  late final String id;

  PigDetailState build(
    String id,
  );
}

/// See also [PigDetailNotifier].
@ProviderFor(PigDetailNotifier)
const pigDetailNotifierProvider = PigDetailNotifierFamily();

/// See also [PigDetailNotifier].
class PigDetailNotifierFamily extends Family<PigDetailState> {
  /// See also [PigDetailNotifier].
  const PigDetailNotifierFamily();

  /// See also [PigDetailNotifier].
  PigDetailNotifierProvider call(
    String id,
  ) {
    return PigDetailNotifierProvider(
      id,
    );
  }

  @override
  PigDetailNotifierProvider getProviderOverride(
    covariant PigDetailNotifierProvider provider,
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
  String? get name => r'pigDetailNotifierProvider';
}

/// See also [PigDetailNotifier].
class PigDetailNotifierProvider
    extends AutoDisposeNotifierProviderImpl<PigDetailNotifier, PigDetailState> {
  /// See also [PigDetailNotifier].
  PigDetailNotifierProvider(
    String id,
  ) : this._internal(
          () => PigDetailNotifier()..id = id,
          from: pigDetailNotifierProvider,
          name: r'pigDetailNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pigDetailNotifierHash,
          dependencies: PigDetailNotifierFamily._dependencies,
          allTransitiveDependencies:
              PigDetailNotifierFamily._allTransitiveDependencies,
          id: id,
        );

  PigDetailNotifierProvider._internal(
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
  PigDetailState runNotifierBuild(
    covariant PigDetailNotifier notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(PigDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PigDetailNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<PigDetailNotifier, PigDetailState>
      createElement() {
    return _PigDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PigDetailNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PigDetailNotifierRef on AutoDisposeNotifierProviderRef<PigDetailState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PigDetailNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<PigDetailNotifier,
        PigDetailState> with PigDetailNotifierRef {
  _PigDetailNotifierProviderElement(super.provider);

  @override
  String get id => (origin as PigDetailNotifierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
