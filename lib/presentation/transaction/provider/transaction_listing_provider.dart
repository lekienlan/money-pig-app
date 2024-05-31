import 'dart:developer';

import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/domain/repository/transaction_repository.dart';
import 'package:money_pig/presentation/transaction/state/transaction_listing_state.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_listing_provider.g.dart';

@riverpod
class TransactionListingNotifier extends _$TransactionListingNotifier {
  @override
  TransactionListingState build(TransactionParams params) {
    fetchTransactionListing(types: params.types, period_id: params.period_id);
    return TransactionListingState.loading();
  }

  final TransactionRepository transactionRepository = TransactionRepository();

  Future<void> fetchTransactionListing(
      {String? period_id, List<TransactionTypeEnum>? types}) async {
    try {
      final resp = await transactionRepository.getTransactionListing(
          types: types, period_id: period_id);

      state = TransactionListingState.data(resp);
    } catch (err) {
      state = TransactionListingState.empty();
    }
  }
}
