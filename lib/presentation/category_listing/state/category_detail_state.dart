import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/domain/model/category_model.dart';

part 'category_detail_state.freezed.dart';

@freezed
class CategoryDetailState with _$CategoryDetailState {
  const factory CategoryDetailState.data(CategoryModel data) = _Data;
  const factory CategoryDetailState.loading() = _Loading;
  const factory CategoryDetailState.empty() = _Empty;
  const factory CategoryDetailState.error() = _Error;
}
