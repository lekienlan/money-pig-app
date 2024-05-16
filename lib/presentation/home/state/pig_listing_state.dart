import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/domain/model/pig_card_model.dart';

part 'pig_listing_state.freezed.dart';

@freezed
class PigListingState with _$PigListingState {
  const factory PigListingState.data(List<PigCardModel> pigListing) = _Data;
  const factory PigListingState.loading() = _Loading;
  const factory PigListingState.empty() = _Empty;
  const factory PigListingState.error() = _Error;
}
