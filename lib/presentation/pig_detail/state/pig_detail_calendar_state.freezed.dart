// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pig_detail_calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PigDetailCalendarState {
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  DateTime? get visibleMonth => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PigDetailCalendarStateCopyWith<PigDetailCalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PigDetailCalendarStateCopyWith<$Res> {
  factory $PigDetailCalendarStateCopyWith(PigDetailCalendarState value,
          $Res Function(PigDetailCalendarState) then) =
      _$PigDetailCalendarStateCopyWithImpl<$Res, PigDetailCalendarState>;
  @useResult
  $Res call({DateTime? selectedDate, DateTime? visibleMonth});
}

/// @nodoc
class _$PigDetailCalendarStateCopyWithImpl<$Res,
        $Val extends PigDetailCalendarState>
    implements $PigDetailCalendarStateCopyWith<$Res> {
  _$PigDetailCalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? visibleMonth = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibleMonth: freezed == visibleMonth
          ? _value.visibleMonth
          : visibleMonth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PigDetailCalendarStateImplCopyWith<$Res>
    implements $PigDetailCalendarStateCopyWith<$Res> {
  factory _$$PigDetailCalendarStateImplCopyWith(
          _$PigDetailCalendarStateImpl value,
          $Res Function(_$PigDetailCalendarStateImpl) then) =
      __$$PigDetailCalendarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? selectedDate, DateTime? visibleMonth});
}

/// @nodoc
class __$$PigDetailCalendarStateImplCopyWithImpl<$Res>
    extends _$PigDetailCalendarStateCopyWithImpl<$Res,
        _$PigDetailCalendarStateImpl>
    implements _$$PigDetailCalendarStateImplCopyWith<$Res> {
  __$$PigDetailCalendarStateImplCopyWithImpl(
      _$PigDetailCalendarStateImpl _value,
      $Res Function(_$PigDetailCalendarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? visibleMonth = freezed,
  }) {
    return _then(_$PigDetailCalendarStateImpl(
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      visibleMonth: freezed == visibleMonth
          ? _value.visibleMonth
          : visibleMonth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$PigDetailCalendarStateImpl implements _PigDetailCalendarState {
  const _$PigDetailCalendarStateImpl({this.selectedDate, this.visibleMonth});

  @override
  final DateTime? selectedDate;
  @override
  final DateTime? visibleMonth;

  @override
  String toString() {
    return 'PigDetailCalendarState(selectedDate: $selectedDate, visibleMonth: $visibleMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PigDetailCalendarStateImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.visibleMonth, visibleMonth) ||
                other.visibleMonth == visibleMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate, visibleMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PigDetailCalendarStateImplCopyWith<_$PigDetailCalendarStateImpl>
      get copyWith => __$$PigDetailCalendarStateImplCopyWithImpl<
          _$PigDetailCalendarStateImpl>(this, _$identity);
}

abstract class _PigDetailCalendarState implements PigDetailCalendarState {
  const factory _PigDetailCalendarState(
      {final DateTime? selectedDate,
      final DateTime? visibleMonth}) = _$PigDetailCalendarStateImpl;

  @override
  DateTime? get selectedDate;
  @override
  DateTime? get visibleMonth;
  @override
  @JsonKey(ignore: true)
  _$$PigDetailCalendarStateImplCopyWith<_$PigDetailCalendarStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
