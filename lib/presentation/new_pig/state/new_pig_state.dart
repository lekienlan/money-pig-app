import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_pig_state.freezed.dart';

@freezed
class NewPigState with _$NewPigState {
  const factory NewPigState({
    String? name,
    num? budget,
    String? startDate,
    String? endDate,
    bool? isSubmitting,
    String? icon,
  }) = _NewPigState;
}
