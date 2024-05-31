// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_listing_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionListingNotifierHash() =>
    r'adc5728f351143831d942d777512afac2d4b814f';

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

abstract class _$TransactionListingNotifier
    extends BuildlessAutoDisposeNotifier<TransactionListingState> {
  late final TransactionParams params;

  TransactionListingState build(
    TransactionParams params,
  );
}

/// See also [TransactionListingNotifier].
@ProviderFor(TransactionListingNotifier)
const transactionListingNotifierProvider = TransactionListingNotifierFamily();

/// See also [TransactionListingNotifier].
class TransactionListingNotifierFamily extends Family<TransactionListingState> {
  /// See also [TransactionListingNotifier].
  const TransactionListingNotifierFamily();

  /// See also [TransactionListingNotifier].
  TransactionListingNotifierProvider call(
    TransactionParams params,
  ) {
    return TransactionListingNotifierProvider(
      params,
    );
  }

  @override
  TransactionListingNotifierProvider getProviderOverride(
    covariant TransactionListingNotifierProvider provider,
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
  String? get name => r'transactionListingNotifierProvider';
}

/// See also [TransactionListingNotifier].
class TransactionListingNotifierProvider
    extends AutoDisposeNotifierProviderImpl<TransactionListingNotifier,
        TransactionListingState> {
  /// See also [TransactionListingNotifier].
  TransactionListingNotifierProvider(
    TransactionParams params,
  ) : this._internal(
          () => TransactionListingNotifier()..params = params,
          from: transactionListingNotifierProvider,
          name: r'transactionListingNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionListingNotifierHash,
          dependencies: TransactionListingNotifierFamily._dependencies,
          allTransitiveDependencies:
              TransactionListingNotifierFamily._allTransitiveDependencies,
          params: params,
        );

  TransactionListingNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final TransactionParams params;

  @override
  TransactionListingState runNotifierBuild(
    covariant TransactionListingNotifier notifier,
  ) {
    return notifier.build(
      params,
    );
  }

  @override
  Override overrideWith(TransactionListingNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionListingNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<TransactionListingNotifier,
      TransactionListingState> createElement() {
    return _TransactionListingNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionListingNotifierProvider &&
        other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransactionListingNotifierRef
    on AutoDisposeNotifierProviderRef<TransactionListingState> {
  /// The parameter `params` of this provider.
  TransactionParams get params;
}

class _TransactionListingNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TransactionListingNotifier,
        TransactionListingState> with TransactionListingNotifierRef {
  _TransactionListingNotifierProviderElement(super.provider);

  @override
  TransactionParams get params =>
      (origin as TransactionListingNotifierProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
