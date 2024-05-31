import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/shared/util/enum.dart';

part 'transaction_input_state.freezed.dart';

@freezed
class TransactionInputState with _$TransactionInputState {
  const factory TransactionInputState({
    num? amount,
    String? note,
    TransactionTypeEnum? type,
  }) = _TransactionInputState;
}
