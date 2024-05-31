import 'dart:developer';

import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/domain/repository/transaction_repository.dart';
import 'package:money_pig/presentation/home/provider/pig_listing_provider.dart';
import 'package:money_pig/presentation/pig_detail/provider/pig_detail_provider.dart';
import 'package:money_pig/presentation/transaction/provider/transaction_listing_provider.dart';
import 'package:money_pig/presentation/transaction/provider/income_provider.dart';
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

  Future<void> onComplete(
      {num? amount, String? period_id, String? note}) async {
    if (state.type == TransactionTypeEnum.income) {
      await TransactionRepository().createTransaction(TransactionModel(
        amount: amount,
        type: TransactionTypeEnum.income,
        note: note,
      ));
      ref.invalidate(incomeNotifierProvider);
    } else if (state.type == TransactionTypeEnum.expense) {
      await TransactionRepository().createTransaction(TransactionModel(
        amount: amount,
        note: note,
        type: TransactionTypeEnum.expense,
        period_id: period_id,
      ));
    } else if (state.type == TransactionTypeEnum.budget) {
      await TransactionRepository().createTransaction(TransactionModel(
        amount: amount,
        note: note,
        type: TransactionTypeEnum.budget,
        period_id: period_id,
      ));
    }
    ref.invalidate(pigListingNotifierProvider);
    ref.invalidate(pigDetailNotifierProvider);
    ref.invalidate(transactionListingNotifierProvider);
    ref.invalidate(incomeNotifierProvider);
  }
}
