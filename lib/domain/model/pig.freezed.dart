// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pig.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pig _$PigFromJson(Map<String, dynamic> json) {
  return _Pig.fromJson(json);
}

/// @nodoc
mixin _$Pig {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  num? get percent => throw _privateConstructorUsedError;
  num? get balance => throw _privateConstructorUsedError;
  Map<String, dynamic>? get style => throw _privateConstructorUsedError;
  DateTime? get updated_at => throw _privateConstructorUsedError;
  DateTime? get created_at => throw _privateConstructorUsedError;
  String? get user_id => throw _privateConstructorUsedError;
  StatusEnum get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PigCopyWith<Pig> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PigCopyWith<$Res> {
  factory $PigCopyWith(Pig value, $Res Function(Pig) then) =
      _$PigCopyWithImpl<$Res, Pig>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      num? percent,
      num? balance,
      Map<String, dynamic>? style,
      DateTime? updated_at,
      DateTime? created_at,
      String? user_id,
      StatusEnum status});
}

/// @nodoc
class _$PigCopyWithImpl<$Res, $Val extends Pig> implements $PigCopyWith<$Res> {
  _$PigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? percent = freezed,
    Object? balance = freezed,
    Object? style = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? user_id = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      percent: freezed == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as num?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PigImplCopyWith<$Res> implements $PigCopyWith<$Res> {
  factory _$$PigImplCopyWith(_$PigImpl value, $Res Function(_$PigImpl) then) =
      __$$PigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      num? percent,
      num? balance,
      Map<String, dynamic>? style,
      DateTime? updated_at,
      DateTime? created_at,
      String? user_id,
      StatusEnum status});
}

/// @nodoc
class __$$PigImplCopyWithImpl<$Res> extends _$PigCopyWithImpl<$Res, _$PigImpl>
    implements _$$PigImplCopyWith<$Res> {
  __$$PigImplCopyWithImpl(_$PigImpl _value, $Res Function(_$PigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? percent = freezed,
    Object? balance = freezed,
    Object? style = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? user_id = freezed,
    Object? status = null,
  }) {
    return _then(_$PigImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      percent: freezed == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as num?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as num?,
      style: freezed == style
          ? _value._style
          : style // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PigImpl implements _Pig {
  const _$PigImpl(
      {this.id,
      this.name,
      this.percent,
      this.balance,
      final Map<String, dynamic>? style = const <String, dynamic>{},
      this.updated_at,
      this.created_at,
      this.user_id,
      this.status = StatusEnum.active})
      : _style = style;

  factory _$PigImpl.fromJson(Map<String, dynamic> json) =>
      _$$PigImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final num? percent;
  @override
  final num? balance;
  final Map<String, dynamic>? _style;
  @override
  @JsonKey()
  Map<String, dynamic>? get style {
    final value = _style;
    if (value == null) return null;
    if (_style is EqualUnmodifiableMapView) return _style;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? updated_at;
  @override
  final DateTime? created_at;
  @override
  final String? user_id;
  @override
  @JsonKey()
  final StatusEnum status;

  @override
  String toString() {
    return 'Pig(id: $id, name: $name, percent: $percent, balance: $balance, style: $style, updated_at: $updated_at, created_at: $created_at, user_id: $user_id, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PigImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            const DeepCollectionEquality().equals(other._style, _style) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      percent,
      balance,
      const DeepCollectionEquality().hash(_style),
      updated_at,
      created_at,
      user_id,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PigImplCopyWith<_$PigImpl> get copyWith =>
      __$$PigImplCopyWithImpl<_$PigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PigImplToJson(
      this,
    );
  }
}

abstract class _Pig implements Pig {
  const factory _Pig(
      {final String? id,
      final String? name,
      final num? percent,
      final num? balance,
      final Map<String, dynamic>? style,
      final DateTime? updated_at,
      final DateTime? created_at,
      final String? user_id,
      final StatusEnum status}) = _$PigImpl;

  factory _Pig.fromJson(Map<String, dynamic> json) = _$PigImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  num? get percent;
  @override
  num? get balance;
  @override
  Map<String, dynamic>? get style;
  @override
  DateTime? get updated_at;
  @override
  DateTime? get created_at;
  @override
  String? get user_id;
  @override
  StatusEnum get status;
  @override
  @JsonKey(ignore: true)
  _$$PigImplCopyWith<_$PigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
