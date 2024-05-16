import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_state.freezed.dart';

@freezed
class IncomeState with _$IncomeState {
  const factory IncomeState.data(num amount) = _Data;
  const factory IncomeState.loading() = _Loading;
  const factory IncomeState.error() = _Error;
}
