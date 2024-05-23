import 'package:money_pig/domain/repository/pig_repository.dart';
import 'package:money_pig/presentation/home/state/pig_listing_state.dart';
import 'package:money_pig/presentation/pig_detail/state/pig_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pig_detail_provider.g.dart';

@riverpod
class PigDetailNotifier extends _$PigDetailNotifier {
  @override
  PigDetailState build(String id) {
    fetchPigDetail(id);
    return PigDetailState.loading();
  }

  final PigRepository pigRepository = PigRepository();

  Future<void> fetchPigDetail(String id) async {
    try {
      final resp = await pigRepository.getPigDetail(id);

      state = PigDetailState.data(resp);
    } catch (err) {
      state = PigDetailState.empty();
    }
  }
}
