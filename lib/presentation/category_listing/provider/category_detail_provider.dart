import 'dart:developer';

import 'package:money_pig/domain/repository/category_repository.dart';
import 'package:money_pig/presentation/category_listing/state/category_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_detail_provider.g.dart';

@riverpod
class CategoryDetailNotifier extends _$CategoryDetailNotifier {
  @override
  CategoryDetailState build(String id) {
    fetchCategoryDetail(id);
    return CategoryDetailState.loading();
  }

  final CategoryRepository categoryRepository = CategoryRepository();

  Future<void> fetchCategoryDetail(String id) async {
    try {
      final resp = await categoryRepository.getCategoryDetail(id);

      log('$resp');
      state = CategoryDetailState.data(resp);
    } catch (err) {
      state = CategoryDetailState.empty();
    }
  }
}
