import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/domain/model/style_model.dart';
import 'package:money_pig/domain/repository/category_repository.dart';
import 'package:money_pig/presentation/category_input/state/category_input_state.dart';
import 'package:money_pig/presentation/category_listing/provider/category_listing_provider.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_input_provider.g.dart';

@riverpod
class CategoryInputNotifier extends _$CategoryInputNotifier {
  @override
  CategoryInputState build() {
    return CategoryInputState(icon: 'fashion');
  }

  void onChangeName(String? value) {
    state = state.copyWith(name: value);
  }

  void onChangeIcon(String? key) async {
    state = state.copyWith(icon: key);
  }

  Future<void> onComplete(
      {String? name, TransactionTypeEnum? type, StyleModel? style}) async {
    await CategoryRepository().createCategory(CategoryModel(
      name: name,
      type: type,
      style: style,
    ));
    ref.invalidateSelf();
    ref.invalidate(categoryListingNotifierProvider);
  }
}
