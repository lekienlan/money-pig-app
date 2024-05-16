import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_input_state.freezed.dart';

@freezed
class AmountInputState with _$AmountInputState {
  const factory AmountInputState({
    num? amount,
  }) = _AmountInputState;
}
