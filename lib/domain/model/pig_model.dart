import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/shared/util/enum.dart';

part 'pig_model.freezed.dart';
part 'pig_model.g.dart';

@freezed
abstract class PigModel with _$PigModel {
  const factory PigModel({
    String? id,
    String? name,
    String? updated_at,
    String? created_at,
    String? user_id,
    String? period_id,
    String? start_date,
    String? end_date,
    num? budget,
    num? expense,
    // @Default(<String, dynamic>{}) Map<String, dynamic>? style,
    @Default(StatusEnum.active) StatusEnum status,
  }) = _PigModel;

  factory PigModel.fromJson(Map<String, dynamic> json) =>
      _$PigModelFromJson(json);
}
