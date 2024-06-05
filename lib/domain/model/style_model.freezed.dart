// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'style_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StyleModel _$StyleModelFromJson(Map<String, dynamic> json) {
  return _StyleModel.fromJson(json);
}

/// @nodoc
mixin _$StyleModel {
  String? get icon => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get backgroundColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StyleModelCopyWith<StyleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StyleModelCopyWith<$Res> {
  factory $StyleModelCopyWith(
          StyleModel value, $Res Function(StyleModel) then) =
      _$StyleModelCopyWithImpl<$Res, StyleModel>;
  @useResult
  $Res call({String? icon, String? color, String? backgroundColor});
}

/// @nodoc
class _$StyleModelCopyWithImpl<$Res, $Val extends StyleModel>
    implements $StyleModelCopyWith<$Res> {
  _$StyleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? color = freezed,
    Object? backgroundColor = freezed,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StyleModelImplCopyWith<$Res>
    implements $StyleModelCopyWith<$Res> {
  factory _$$StyleModelImplCopyWith(
          _$StyleModelImpl value, $Res Function(_$StyleModelImpl) then) =
      __$$StyleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? icon, String? color, String? backgroundColor});
}

/// @nodoc
class __$$StyleModelImplCopyWithImpl<$Res>
    extends _$StyleModelCopyWithImpl<$Res, _$StyleModelImpl>
    implements _$$StyleModelImplCopyWith<$Res> {
  __$$StyleModelImplCopyWithImpl(
      _$StyleModelImpl _value, $Res Function(_$StyleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? color = freezed,
    Object? backgroundColor = freezed,
  }) {
    return _then(_$StyleModelImpl(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      backgroundColor: freezed == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StyleModelImpl implements _StyleModel {
  const _$StyleModelImpl({this.icon, this.color, this.backgroundColor});

  factory _$StyleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StyleModelImplFromJson(json);

  @override
  final String? icon;
  @override
  final String? color;
  @override
  final String? backgroundColor;

  @override
  String toString() {
    return 'StyleModel(icon: $icon, color: $color, backgroundColor: $backgroundColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StyleModelImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, icon, color, backgroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StyleModelImplCopyWith<_$StyleModelImpl> get copyWith =>
      __$$StyleModelImplCopyWithImpl<_$StyleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StyleModelImplToJson(
      this,
    );
  }
}

abstract class _StyleModel implements StyleModel {
  const factory _StyleModel(
      {final String? icon,
      final String? color,
      final String? backgroundColor}) = _$StyleModelImpl;

  factory _StyleModel.fromJson(Map<String, dynamic> json) =
      _$StyleModelImpl.fromJson;

  @override
  String? get icon;
  @override
  String? get color;
  @override
  String? get backgroundColor;
  @override
  @JsonKey(ignore: true)
  _$$StyleModelImplCopyWith<_$StyleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
