// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_pig_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewPigState {
  String? get name => throw _privateConstructorUsedError;
  num? get budget => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  bool? get isSubmitting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPigStateCopyWith<NewPigState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPigStateCopyWith<$Res> {
  factory $NewPigStateCopyWith(
          NewPigState value, $Res Function(NewPigState) then) =
      _$NewPigStateCopyWithImpl<$Res, NewPigState>;
  @useResult
  $Res call(
      {String? name,
      num? budget,
      String? startDate,
      String? endDate,
      bool? isSubmitting});
}

/// @nodoc
class _$NewPigStateCopyWithImpl<$Res, $Val extends NewPigState>
    implements $NewPigStateCopyWith<$Res> {
  _$NewPigStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? budget = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as num?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: freezed == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPigStateImplCopyWith<$Res>
    implements $NewPigStateCopyWith<$Res> {
  factory _$$NewPigStateImplCopyWith(
          _$NewPigStateImpl value, $Res Function(_$NewPigStateImpl) then) =
      __$$NewPigStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      num? budget,
      String? startDate,
      String? endDate,
      bool? isSubmitting});
}

/// @nodoc
class __$$NewPigStateImplCopyWithImpl<$Res>
    extends _$NewPigStateCopyWithImpl<$Res, _$NewPigStateImpl>
    implements _$$NewPigStateImplCopyWith<$Res> {
  __$$NewPigStateImplCopyWithImpl(
      _$NewPigStateImpl _value, $Res Function(_$NewPigStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? budget = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$NewPigStateImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as num?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: freezed == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$NewPigStateImpl implements _NewPigState {
  const _$NewPigStateImpl(
      {this.name,
      this.budget,
      this.startDate,
      this.endDate,
      this.isSubmitting});

  @override
  final String? name;
  @override
  final num? budget;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final bool? isSubmitting;

  @override
  String toString() {
    return 'NewPigState(name: $name, budget: $budget, startDate: $startDate, endDate: $endDate, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPigStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, budget, startDate, endDate, isSubmitting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPigStateImplCopyWith<_$NewPigStateImpl> get copyWith =>
      __$$NewPigStateImplCopyWithImpl<_$NewPigStateImpl>(this, _$identity);
}

abstract class _NewPigState implements NewPigState {
  const factory _NewPigState(
      {final String? name,
      final num? budget,
      final String? startDate,
      final String? endDate,
      final bool? isSubmitting}) = _$NewPigStateImpl;

  @override
  String? get name;
  @override
  num? get budget;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  bool? get isSubmitting;
  @override
  @JsonKey(ignore: true)
  _$$NewPigStateImplCopyWith<_$NewPigStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
