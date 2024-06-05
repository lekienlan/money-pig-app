// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryInputState {
  String? get name => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  TransactionTypeEnum? get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryInputStateCopyWith<CategoryInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryInputStateCopyWith<$Res> {
  factory $CategoryInputStateCopyWith(
          CategoryInputState value, $Res Function(CategoryInputState) then) =
      _$CategoryInputStateCopyWithImpl<$Res, CategoryInputState>;
  @useResult
  $Res call({String? name, String? icon, TransactionTypeEnum? type});
}

/// @nodoc
class _$CategoryInputStateCopyWithImpl<$Res, $Val extends CategoryInputState>
    implements $CategoryInputStateCopyWith<$Res> {
  _$CategoryInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionTypeEnum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryInputStateImplCopyWith<$Res>
    implements $CategoryInputStateCopyWith<$Res> {
  factory _$$CategoryInputStateImplCopyWith(_$CategoryInputStateImpl value,
          $Res Function(_$CategoryInputStateImpl) then) =
      __$$CategoryInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? icon, TransactionTypeEnum? type});
}

/// @nodoc
class __$$CategoryInputStateImplCopyWithImpl<$Res>
    extends _$CategoryInputStateCopyWithImpl<$Res, _$CategoryInputStateImpl>
    implements _$$CategoryInputStateImplCopyWith<$Res> {
  __$$CategoryInputStateImplCopyWithImpl(_$CategoryInputStateImpl _value,
      $Res Function(_$CategoryInputStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? icon = freezed,
    Object? type = freezed,
  }) {
    return _then(_$CategoryInputStateImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionTypeEnum?,
    ));
  }
}

/// @nodoc

class _$CategoryInputStateImpl implements _CategoryInputState {
  const _$CategoryInputStateImpl({this.name, this.icon, this.type});

  @override
  final String? name;
  @override
  final String? icon;
  @override
  final TransactionTypeEnum? type;

  @override
  String toString() {
    return 'CategoryInputState(name: $name, icon: $icon, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryInputStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, icon, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryInputStateImplCopyWith<_$CategoryInputStateImpl> get copyWith =>
      __$$CategoryInputStateImplCopyWithImpl<_$CategoryInputStateImpl>(
          this, _$identity);
}

abstract class _CategoryInputState implements CategoryInputState {
  const factory _CategoryInputState(
      {final String? name,
      final String? icon,
      final TransactionTypeEnum? type}) = _$CategoryInputStateImpl;

  @override
  String? get name;
  @override
  String? get icon;
  @override
  TransactionTypeEnum? get type;
  @override
  @JsonKey(ignore: true)
  _$$CategoryInputStateImplCopyWith<_$CategoryInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
