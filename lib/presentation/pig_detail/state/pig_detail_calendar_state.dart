import 'package:freezed_annotation/freezed_annotation.dart';

part 'pig_detail_calendar_state.freezed.dart';

@freezed
class PigDetailCalendarState with _$PigDetailCalendarState {
  const factory PigDetailCalendarState({
    DateTime? selectedDate,
    DateTime? visibleMonth,
  }) = _PigDetailCalendarState;
}
