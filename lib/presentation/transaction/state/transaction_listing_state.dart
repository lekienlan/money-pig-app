import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/domain/model/transaction_model.dart';

part 'transaction_listing_state.freezed.dart';

@freezed
class TransactionListingState with _$TransactionListingState {
  const factory TransactionListingState.data(List<TransactionModel> data) =
      _Data;
  const factory TransactionListingState.loading() = _Loading;
  const factory TransactionListingState.empty() = _Empty;
  const factory TransactionListingState.error() = _Error;
}
