// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_input_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionInputNotifierHash() =>
    r'1836f74db1ccf27bc70167b2f7b671990602117c';

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

abstract class _$TransactionInputNotifier
    extends BuildlessNotifier<TransactionInputState> {
  late final TransactionTypeEnum? type;

  TransactionInputState build({
    TransactionTypeEnum? type,
  });
}

/// See also [TransactionInputNotifier].
@ProviderFor(TransactionInputNotifier)
const transactionInputNotifierProvider = TransactionInputNotifierFamily();

/// See also [TransactionInputNotifier].
class TransactionInputNotifierFamily extends Family<TransactionInputState> {
  /// See also [TransactionInputNotifier].
  const TransactionInputNotifierFamily();

  /// See also [TransactionInputNotifier].
  TransactionInputNotifierProvider call({
    TransactionTypeEnum? type,
  }) {
    return TransactionInputNotifierProvider(
      type: type,
    );
  }

  @override
  TransactionInputNotifierProvider getProviderOverride(
    covariant TransactionInputNotifierProvider provider,
  ) {
    return call(
      type: provider.type,
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
  String? get name => r'transactionInputNotifierProvider';
}

/// See also [TransactionInputNotifier].
class TransactionInputNotifierProvider extends NotifierProviderImpl<
    TransactionInputNotifier, TransactionInputState> {
  /// See also [TransactionInputNotifier].
  TransactionInputNotifierProvider({
    TransactionTypeEnum? type,
  }) : this._internal(
          () => TransactionInputNotifier()..type = type,
          from: transactionInputNotifierProvider,
          name: r'transactionInputNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionInputNotifierHash,
          dependencies: TransactionInputNotifierFamily._dependencies,
          allTransitiveDependencies:
              TransactionInputNotifierFamily._allTransitiveDependencies,
          type: type,
        );

  TransactionInputNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final TransactionTypeEnum? type;

  @override
  TransactionInputState runNotifierBuild(
    covariant TransactionInputNotifier notifier,
  ) {
    return notifier.build(
      type: type,
    );
  }

  @override
  Override overrideWith(TransactionInputNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TransactionInputNotifierProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  NotifierProviderElement<TransactionInputNotifier, TransactionInputState>
      createElement() {
    return _TransactionInputNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionInputNotifierProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TransactionInputNotifierRef
    on NotifierProviderRef<TransactionInputState> {
  /// The parameter `type` of this provider.
  TransactionTypeEnum? get type;
}

class _TransactionInputNotifierProviderElement extends NotifierProviderElement<
    TransactionInputNotifier,
    TransactionInputState> with TransactionInputNotifierRef {
  _TransactionInputNotifierProviderElement(super.provider);

  @override
  TransactionTypeEnum? get type =>
      (origin as TransactionInputNotifierProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
