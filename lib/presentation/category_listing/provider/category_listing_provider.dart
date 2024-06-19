import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/domain/repository/category_repository.dart';
import 'package:money_pig/presentation/category_listing/state/category_listing_state.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_listing_provider.g.dart';

@riverpod
class CategoryListingNotifier extends _$CategoryListingNotifier {
  @override
  CategoryListingState build(CategoryParams params) {
    fetchCategoryListing(types: params.types);
    return CategoryListingState.loading();
  }

  final CategoryRepository categoryRepository = CategoryRepository();

  Future<void> fetchCategoryListing({List<TransactionTypeEnum>? types}) async {
    try {
      final resp = await categoryRepository.getCategoryListing(types: types);
      state = CategoryListingState.data(resp);
    } catch (err) {
      state = CategoryListingState.empty();
    }
  }
}
