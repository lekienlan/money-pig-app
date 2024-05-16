import 'package:money_pig/domain/repository/pig_repository.dart';
import 'package:money_pig/presentation/home/state/pig_listing_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pig_listing_provider.g.dart';

@riverpod
class PigListingNotifier extends _$PigListingNotifier {
  @override
  PigListingState build() {
    fetchPigListing();
    return PigListingState.loading();
  }

  final PigRepository pigRepository = PigRepository();

  Future<void> fetchPigListing() async {
    try {
      final resp = await pigRepository.getPigListing();

      if (resp.isEmpty) {
        state = PigListingState.empty();
        return;
      }

      state = PigListingState.data(resp);
    } catch (err) {
      state = PigListingState.empty();
    }
  }
}
