import 'package:money_pig/presentation/new_pig/state/new_pig_state.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_pig_provider.g.dart';

@riverpod
class NewPigNotifier extends _$NewPigNotifier {
  @override
  NewPigState build() {
    DateTime currentDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    return NewPigState(
      name: null,
      startDate: currentDate.toIso8601String(),
      // budget: 200000,
      // endDate:
      //     DateTime(currentDate.year, currentDate.month + 1, currentDate.day)
      //         .toIso8601String(),
    );
  }

  void onChangeName(String? value) {
    state = state.copyWith(name: value);
  }

  void onChangeBudget(String? value) {
    String? cleanedString = value?.replaceAll(RegExp(r'[^0-9]'), '');
    state = state.copyWith(
        budget:
            isTruthy(cleanedString) ? num.parse(cleanedString ?? '0') : null);

    ;
  }

  void onChangeTimeRange({String? startDate, String? endDate}) {
    state = state.copyWith(startDate: startDate, endDate: endDate);
  }
}
