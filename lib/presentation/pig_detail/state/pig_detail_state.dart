import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/domain/model/pig_model.dart';

part 'pig_detail_state.freezed.dart';

@freezed
class PigDetailState with _$PigDetailState {
  const factory PigDetailState.data(PigModel data) = _Data;
  const factory PigDetailState.loading() = _Loading;
  const factory PigDetailState.empty() = _Empty;
  const factory PigDetailState.error() = _Error;
}
