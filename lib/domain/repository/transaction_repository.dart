import 'dart:developer';

import 'package:money_pig/data/local/local_transaction_service.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/shared/util/enum.dart';

abstract class TransactionRepositoryProtocol {
  Future<num> getTransactionAmount({TransactionTypeEnum? type});
  Future<void> createTransaction(TransactionModel data);
  Future<List<TransactionModel>> getTransactionListing(
      {List<TransactionTypeEnum>? types, String? period_id});
}

class TransactionRepository implements TransactionRepositoryProtocol {
  LocalTransactionService transactionService = LocalTransactionService();

  @override
  Future<void> createTransaction(TransactionModel data) async {
    try {
      await transactionService.createTransaction(data);
    } catch (err) {
      throw Error();
    }
  }

  @override
  Future<num> getTransactionAmount({TransactionTypeEnum? type}) async {
    try {
      return await transactionService.getTransactionAmount(
        type: type,
      );
    } catch (err) {
      throw Error();
    }
  }

  @override
  Future<List<TransactionModel>> getTransactionListing(
      {List<TransactionTypeEnum>? types, String? period_id}) async {
    try {
      return await transactionService.getTransactionListing(
        types: types,
        period_id: period_id,
      );
    } catch (err) {
      log('$err');
      throw Error();
    }
  }
}
