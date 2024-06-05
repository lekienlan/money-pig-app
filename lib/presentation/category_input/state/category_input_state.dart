import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/shared/util/enum.dart';

part 'category_input_state.freezed.dart';

@freezed
class CategoryInputState with _$CategoryInputState {
  const factory CategoryInputState({
    String? name,
    String? icon,
    TransactionTypeEnum? type,
  }) = _CategoryInputState;
}
