import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:equatable/equatable.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    String? id,
    String? name,
    String? code,
    TransactionTypeEnum? type,
    String? created_at,
    String? updated_at,
    @Default(StatusEnum.active) StatusEnum status,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

class CategoryParams extends Equatable {
  final List<TransactionTypeEnum>? types;

  CategoryParams({this.types});

  @override
  List<Object?> get props => [types];
}
