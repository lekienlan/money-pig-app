import 'package:money_pig/domain/model/pig.dart';
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

  Future<void> fetchPigListing() async {
    await Future.delayed(Duration(milliseconds: 200));

    // state = PigListingState.empty();

    state = PigListingState.data([
      Pig(
        id: '12',
        name: 'Tiền nhà',
        percent: 90,
        balance: 217000,
      ),
      Pig(
        id: '12',
        name: 'Tiền chợ',
        percent: 80,
        balance: 1963000,
      ),
      Pig(
        id: '12',
        name: 'Tiền cafe',
        percent: 10,
        balance: 82000,
      ),
      Pig(
        id: '12',
        name: 'Tiền học',
        percent: 50,
        balance: 739000,
      ),
      Pig(
          id: '12',
          name: 'Tiền nuôi Đỗ Hà Đông Phương',
          percent: 100,
          balance: 2819000),
      Pig(
          id: '12',
          name: 'Tiền nuôi Đỗ Hà Đông Phương',
          percent: 60,
          balance: 10245000),
      Pig(
          id: '12',
          name: 'Tiền nuôi Đỗ Hà Đông Phương',
          percent: 30,
          balance: 800200300),
      Pig(
          id: '12',
          name: 'Tiền nuôi Đỗ Hà Đông Phương',
          percent: 25,
          balance: 800300),
      Pig(
          id: '12',
          name: 'Tiền nuôi Đỗ Hà Đông Phương',
          percent: 10,
          balance: 800200),
    ]);
  }
}
