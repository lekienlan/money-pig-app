import 'package:money_pig/data/local/local_category_service.dart';
import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/shared/util/enum.dart';

abstract class CategoryRepositoryProtocol {
  Future<void> createCategory(CategoryModel data);
  Future<void> updateCategory(CategoryModel data);
  Future<void> getCategoryDetail(String id);
  Future<List<CategoryModel>> getCategoryListing(
      {List<TransactionTypeEnum>? types});
}

class CategoryRepository implements CategoryRepositoryProtocol {
  LocalCategoryService categoryService = LocalCategoryService();

  @override
  Future<void> createCategory(CategoryModel data) async {
    try {
      await categoryService.createCategory(data);
    } catch (err) {
      throw Error();
    }
  }

  @override
  Future<void> updateCategory(CategoryModel data) async {
    try {
      await categoryService.updateCategory(data);
    } catch (err) {
      throw Error();
    }
  }

  @override
  Future<List<CategoryModel>> getCategoryListing(
      {List<TransactionTypeEnum>? types}) async {
    try {
      return await categoryService.getCategoryListing(
        types: types,
      );
    } catch (err) {
      throw Error();
    }
  }

  @override
  Future<CategoryModel> getCategoryDetail(String id) async {
    try {
      return await categoryService.getCategoryDetail(id);
    } catch (err) {
      throw Error();
    }
  }
}
