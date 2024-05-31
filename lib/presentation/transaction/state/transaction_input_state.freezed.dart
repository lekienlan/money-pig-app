// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionInputState {
  num? get amount => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  TransactionTypeEnum? get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionInputStateCopyWith<TransactionInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInputStateCopyWith<$Res> {
  factory $TransactionInputStateCopyWith(TransactionInputState value,
          $Res Function(TransactionInputState) then) =
      _$TransactionInputStateCopyWithImpl<$Res, TransactionInputState>;
  @useResult
  $Res call({num? amount, String? note, TransactionTypeEnum? type});
}

/// @nodoc
class _$TransactionInputStateCopyWithImpl<$Res,
        $Val extends TransactionInputState>
    implements $TransactionInputStateCopyWith<$Res> {
  _$TransactionInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? note = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionTypeEnum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionInputStateImplCopyWith<$Res>
    implements $TransactionInputStateCopyWith<$Res> {
  factory _$$TransactionInputStateImplCopyWith(
          _$TransactionInputStateImpl value,
          $Res Function(_$TransactionInputStateImpl) then) =
      __$$TransactionInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? amount, String? note, TransactionTypeEnum? type});
}

/// @nodoc
class __$$TransactionInputStateImplCopyWithImpl<$Res>
    extends _$TransactionInputStateCopyWithImpl<$Res,
        _$TransactionInputStateImpl>
    implements _$$TransactionInputStateImplCopyWith<$Res> {
  __$$TransactionInputStateImplCopyWithImpl(_$TransactionInputStateImpl _value,
      $Res Function(_$TransactionInputStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? note = freezed,
    Object? type = freezed,
  }) {
    return _then(_$TransactionInputStateImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionTypeEnum?,
    ));
  }
}

/// @nodoc

class _$TransactionInputStateImpl implements _TransactionInputState {
  const _$TransactionInputStateImpl({this.amount, this.note, this.type});

  @override
  final num? amount;
  @override
  final String? note;
  @override
  final TransactionTypeEnum? type;

  @override
  String toString() {
    return 'TransactionInputState(amount: $amount, note: $note, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionInputStateImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, note, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionInputStateImplCopyWith<_$TransactionInputStateImpl>
      get copyWith => __$$TransactionInputStateImplCopyWithImpl<
          _$TransactionInputStateImpl>(this, _$identity);
}

abstract class _TransactionInputState implements TransactionInputState {
  const factory _TransactionInputState(
      {final num? amount,
      final String? note,
      final TransactionTypeEnum? type}) = _$TransactionInputStateImpl;

  @override
  num? get amount;
  @override
  String? get note;
  @override
  TransactionTypeEnum? get type;
  @override
  @JsonKey(ignore: true)
  _$$TransactionInputStateImplCopyWith<_$TransactionInputStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
