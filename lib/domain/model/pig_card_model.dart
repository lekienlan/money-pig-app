import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/shared/util/enum.dart';

part 'pig_card_model.freezed.dart';
part 'pig_card_model.g.dart';

@freezed
abstract class PigCardModel with _$PigCardModel {
  const factory PigCardModel({
    String? id,
    String? name,
    num? budget,
    String? start_date,
    String? end_date,
    String? updated_at,
    String? created_at,
    String? user_id,
    // @Default(<String, dynamic>{}) Map<String, dynamic>? style,
    @Default(StatusEnum.active) StatusEnum status,
  }) = _PigCardModel;

  factory PigCardModel.fromJson(Map<String, dynamic> json) =>
      _$PigCardModelFromJson(json);
}
