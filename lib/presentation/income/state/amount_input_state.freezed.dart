// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'amount_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AmountInputState {
  num? get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AmountInputStateCopyWith<AmountInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AmountInputStateCopyWith<$Res> {
  factory $AmountInputStateCopyWith(
          AmountInputState value, $Res Function(AmountInputState) then) =
      _$AmountInputStateCopyWithImpl<$Res, AmountInputState>;
  @useResult
  $Res call({num? amount});
}

/// @nodoc
class _$AmountInputStateCopyWithImpl<$Res, $Val extends AmountInputState>
    implements $AmountInputStateCopyWith<$Res> {
  _$AmountInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AmountInputStateImplCopyWith<$Res>
    implements $AmountInputStateCopyWith<$Res> {
  factory _$$AmountInputStateImplCopyWith(_$AmountInputStateImpl value,
          $Res Function(_$AmountInputStateImpl) then) =
      __$$AmountInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? amount});
}

/// @nodoc
class __$$AmountInputStateImplCopyWithImpl<$Res>
    extends _$AmountInputStateCopyWithImpl<$Res, _$AmountInputStateImpl>
    implements _$$AmountInputStateImplCopyWith<$Res> {
  __$$AmountInputStateImplCopyWithImpl(_$AmountInputStateImpl _value,
      $Res Function(_$AmountInputStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_$AmountInputStateImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc

class _$AmountInputStateImpl implements _AmountInputState {
  const _$AmountInputStateImpl({this.amount});

  @override
  final num? amount;

  @override
  String toString() {
    return 'AmountInputState(amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmountInputStateImpl &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AmountInputStateImplCopyWith<_$AmountInputStateImpl> get copyWith =>
      __$$AmountInputStateImplCopyWithImpl<_$AmountInputStateImpl>(
          this, _$identity);
}

abstract class _AmountInputState implements AmountInputState {
  const factory _AmountInputState({final num? amount}) = _$AmountInputStateImpl;

  @override
  num? get amount;
  @override
  @JsonKey(ignore: true)
  _$$AmountInputStateImplCopyWith<_$AmountInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
