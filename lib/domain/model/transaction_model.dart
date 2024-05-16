import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/shared/util/enum.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    String? id,
    num? amount,
    TransactionTypeEnum? type,
    String? created_at,
    @Default(StatusEnum.active) StatusEnum status,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}
