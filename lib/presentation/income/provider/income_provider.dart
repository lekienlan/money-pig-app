import 'dart:developer';

import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/domain/repository/transaction_repository.dart';
import 'package:money_pig/presentation/income/state/income_state.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'income_provider.g.dart';

@riverpod
class IncomeNotifier extends _$IncomeNotifier {
  @override
  IncomeState build() {
    fetchIncome();
    return IncomeState.loading();
  }

  Future<void> fetchIncome() async {
    try {
      final budget = await TransactionRepository()
          .getTransactionAmount(type: TransactionTypeEnum.budget);
      final income = await TransactionRepository()
          .getTransactionAmount(type: TransactionTypeEnum.income);

      log('$income');
      state = IncomeState.data(income - budget);
    } catch (err) {
      state = IncomeState.data(0);
    }
  }

  Future<void> handleAddIncome(num? amount) async {
    try {
      await TransactionRepository().createTransaction(
          TransactionModel(amount: amount, type: TransactionTypeEnum.income));

      ref.invalidateSelf();
    } catch (err) {}
  }
}
