// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pig_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PigModel _$PigModelFromJson(Map<String, dynamic> json) {
  return _PigModel.fromJson(json);
}

/// @nodoc
mixin _$PigModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get updated_at => throw _privateConstructorUsedError;
  String? get created_at => throw _privateConstructorUsedError;
  String? get user_id => throw _privateConstructorUsedError;
  String? get period_id => throw _privateConstructorUsedError;
  String? get start_date => throw _privateConstructorUsedError;
  String? get end_date => throw _privateConstructorUsedError;
  num? get budget => throw _privateConstructorUsedError;
  num? get expense => throw _privateConstructorUsedError;
  StyleModel? get style => throw _privateConstructorUsedError;
  StatusEnum get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PigModelCopyWith<PigModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PigModelCopyWith<$Res> {
  factory $PigModelCopyWith(PigModel value, $Res Function(PigModel) then) =
      _$PigModelCopyWithImpl<$Res, PigModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? updated_at,
      String? created_at,
      String? user_id,
      String? period_id,
      String? start_date,
      String? end_date,
      num? budget,
      num? expense,
      StyleModel? style,
      StatusEnum status});

  $StyleModelCopyWith<$Res>? get style;
}

/// @nodoc
class _$PigModelCopyWithImpl<$Res, $Val extends PigModel>
    implements $PigModelCopyWith<$Res> {
  _$PigModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? user_id = freezed,
    Object? period_id = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
    Object? budget = freezed,
    Object? expense = freezed,
    Object? style = freezed,
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
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      period_id: freezed == period_id
          ? _value.period_id
          : period_id // ignore: cast_nullable_to_non_nullable
              as String?,
      start_date: freezed == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      end_date: freezed == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as num?,
      expense: freezed == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as num?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StyleModelCopyWith<$Res>? get style {
    if (_value.style == null) {
      return null;
    }

    return $StyleModelCopyWith<$Res>(_value.style!, (value) {
      return _then(_value.copyWith(style: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PigModelImplCopyWith<$Res>
    implements $PigModelCopyWith<$Res> {
  factory _$$PigModelImplCopyWith(
          _$PigModelImpl value, $Res Function(_$PigModelImpl) then) =
      __$$PigModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? updated_at,
      String? created_at,
      String? user_id,
      String? period_id,
      String? start_date,
      String? end_date,
      num? budget,
      num? expense,
      StyleModel? style,
      StatusEnum status});

  @override
  $StyleModelCopyWith<$Res>? get style;
}

/// @nodoc
class __$$PigModelImplCopyWithImpl<$Res>
    extends _$PigModelCopyWithImpl<$Res, _$PigModelImpl>
    implements _$$PigModelImplCopyWith<$Res> {
  __$$PigModelImplCopyWithImpl(
      _$PigModelImpl _value, $Res Function(_$PigModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? updated_at = freezed,
    Object? created_at = freezed,
    Object? user_id = freezed,
    Object? period_id = freezed,
    Object? start_date = freezed,
    Object? end_date = freezed,
    Object? budget = freezed,
    Object? expense = freezed,
    Object? style = freezed,
    Object? status = null,
  }) {
    return _then(_$PigModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      updated_at: freezed == updated_at
          ? _value.updated_at
          : updated_at // ignore: cast_nullable_to_non_nullable
              as String?,
      created_at: freezed == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as String?,
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      period_id: freezed == period_id
          ? _value.period_id
          : period_id // ignore: cast_nullable_to_non_nullable
              as String?,
      start_date: freezed == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String?,
      end_date: freezed == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String?,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as num?,
      expense: freezed == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as num?,
      style: freezed == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as StyleModel?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusEnum,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PigModelImpl implements _PigModel {
  const _$PigModelImpl(
      {this.id,
      this.name,
      this.updated_at,
      this.created_at,
      this.user_id,
      this.period_id,
      this.start_date,
      this.end_date,
      this.budget,
      this.expense,
      this.style,
      this.status = StatusEnum.active});

  factory _$PigModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PigModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? updated_at;
  @override
  final String? created_at;
  @override
  final String? user_id;
  @override
  final String? period_id;
  @override
  final String? start_date;
  @override
  final String? end_date;
  @override
  final num? budget;
  @override
  final num? expense;
  @override
  final StyleModel? style;
  @override
  @JsonKey()
  final StatusEnum status;

  @override
  String toString() {
    return 'PigModel(id: $id, name: $name, updated_at: $updated_at, created_at: $created_at, user_id: $user_id, period_id: $period_id, start_date: $start_date, end_date: $end_date, budget: $budget, expense: $expense, style: $style, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PigModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.updated_at, updated_at) ||
                other.updated_at == updated_at) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.period_id, period_id) ||
                other.period_id == period_id) &&
            (identical(other.start_date, start_date) ||
                other.start_date == start_date) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, updated_at, created_at,
      user_id, period_id, start_date, end_date, budget, expense, style, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PigModelImplCopyWith<_$PigModelImpl> get copyWith =>
      __$$PigModelImplCopyWithImpl<_$PigModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PigModelImplToJson(
      this,
    );
  }
}

abstract class _PigModel implements PigModel {
  const factory _PigModel(
      {final String? id,
      final String? name,
      final String? updated_at,
      final String? created_at,
      final String? user_id,
      final String? period_id,
      final String? start_date,
      final String? end_date,
      final num? budget,
      final num? expense,
      final StyleModel? style,
      final StatusEnum status}) = _$PigModelImpl;

  factory _PigModel.fromJson(Map<String, dynamic> json) =
      _$PigModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get updated_at;
  @override
  String? get created_at;
  @override
  String? get user_id;
  @override
  String? get period_id;
  @override
  String? get start_date;
  @override
  String? get end_date;
  @override
  num? get budget;
  @override
  num? get expense;
  @override
  StyleModel? get style;
  @override
  StatusEnum get status;
  @override
  @JsonKey(ignore: true)
  _$$PigModelImplCopyWith<_$PigModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
