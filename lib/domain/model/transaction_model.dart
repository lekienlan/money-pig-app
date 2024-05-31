import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:equatable/equatable.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    String? id,
    num? amount,
    String? note,
    TransactionTypeEnum? type,
    String? created_at,
    String? period_id,
    @Default(StatusEnum.active) StatusEnum status,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

class TransactionParams extends Equatable {
  final List<TransactionTypeEnum>? types;
  final String? period_id;

  TransactionParams({this.types, this.period_id});

  @override
  List<Object?> get props => [types, period_id];
}
