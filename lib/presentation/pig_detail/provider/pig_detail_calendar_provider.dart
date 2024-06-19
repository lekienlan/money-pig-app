import 'package:money_pig/domain/repository/transaction_repository.dart';
import 'package:money_pig/presentation/pig_detail/state/pig_detail_calendar_state.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pig_detail_calendar_provider.g.dart';

@riverpod
class PigDetailCalendarNotifier extends _$PigDetailCalendarNotifier {
  @override
  PigDetailCalendarState build() {
    return PigDetailCalendarState();
  }

  Future<void> onSelectDate(DateTime? date) async {
    state = state.copyWith(selectedDate: date);
  }

  void onChangeVisibleMonth(DateTime visibleMonth) {
    state = state.copyWith(visibleMonth: visibleMonth);
  }

  // Cache for checkDateMatch results
  final Map<String, bool> _dateMatchCache = {};

  Future<int?> checkIfDateMatch({
    String? period_id,
    String? date,
    TransactionTypeEnum? type,
  }) async {
    final resp = await TransactionRepository()
        .getTransactionAmount(type: type, period_id: period_id, date: date);

    return resp.toInt();
  }

  Future<List<int?>> getTransactionAmountsForDate({
    required String periodId,
    required String date,
  }) async {
    final budgetAmount = await checkIfDateMatch(
      period_id: periodId,
      date: date,
      type: TransactionTypeEnum.budget,
    );
    final transactionAmount = await checkIfDateMatch(
      period_id: periodId,
      date: date,
      type: TransactionTypeEnum.expense,
    );
    return [budgetAmount, transactionAmount];
  }

  void clearCache() {
    _dateMatchCache.clear();
  }
}
