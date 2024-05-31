import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/domain/model/category_model.dart';

part 'category_listing_state.freezed.dart';

@freezed
class CategoryListingState with _$CategoryListingState {
  const factory CategoryListingState.data(List<CategoryModel> data) = _Data;
  const factory CategoryListingState.loading() = _Loading;
  const factory CategoryListingState.empty() = _Empty;
  const factory CategoryListingState.error() = _Error;
}
