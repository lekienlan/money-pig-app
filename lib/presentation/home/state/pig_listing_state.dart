import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_pig/domain/model/pig.dart';

part 'pig_listing_state.freezed.dart';

@freezed
class PigListingState with _$PigListingState {
  const factory PigListingState.data(List<Pig> pigListing) = _Loaded;
  const factory PigListingState.loading() = _Loading;
  const factory PigListingState.empty() = _Empty;
  const factory PigListingState.error() = _Error;
}
