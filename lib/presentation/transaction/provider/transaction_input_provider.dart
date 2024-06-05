import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/domain/repository/transaction_repository.dart';
import 'package:money_pig/presentation/home/provider/pig_listing_provider.dart';
import 'package:money_pig/presentation/pig_detail/provider/pig_detail_provider.dart';
import 'package:money_pig/presentation/transaction/provider/income_provider.dart';
import 'package:money_pig/presentation/transaction/provider/transaction_listing_provider.dart';
import 'package:money_pig/presentation/transaction/state/transaction_input_state.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_input_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionInputNotifier extends _$TransactionInputNotifier {
  @override
  TransactionInputState build({TransactionTypeEnum? type}) {
    return TransactionInputState(type: type);
  }

  void onChangeNote(String? value) {
    state = state.copyWith(note: value);
  }

  void onChangeAmount(String? value) {
    String? cleanedString = value?.replaceAll(RegExp(r'[^0-9]'), '');
    state = state.copyWith(
        amount:
            isTruthy(cleanedString) ? num.parse(cleanedString ?? '0') : null);
    ;
  }

  void onSelectCategory(CategoryModel? category) {
    state = state.copyWith(selectedCategory: category);
    ;
  }

  Future<void> onComplete(TransactionModel data) async {
    if (state.type == TransactionTypeEnum.income) {
      await TransactionRepository().createTransaction(TransactionModel(
        amount: data.amount,
        note: data.note,
        type: TransactionTypeEnum.income,
        category_id: data.category_id,
      ));
      ref.invalidate(incomeNotifierProvider);
    } else if (state.type == TransactionTypeEnum.expense) {
      await TransactionRepository().createTransaction(TransactionModel(
          amount: data.amount,
          note: data.note,
          period_id: data.period_id,
          type: TransactionTypeEnum.expense,
          category_id: data.category_id));
    } else if (state.type == TransactionTypeEnum.budget) {
      await TransactionRepository().createTransaction(TransactionModel(
        amount: data.amount,
        note: data.note,
        period_id: data.period_id,
        type: TransactionTypeEnum.budget,
      ));
    }
    ref.invalidate(pigListingNotifierProvider);
    ref.invalidate(pigDetailNotifierProvider);
    ref.invalidate(transactionListingNotifierProvider);
    ref.invalidate(incomeNotifierProvider);
  }
}
