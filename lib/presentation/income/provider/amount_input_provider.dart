import 'package:money_pig/presentation/income/state/amount_input_state.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'amount_input_provider.g.dart';

@Riverpod(keepAlive: true)
class AmountInputNotifier extends _$AmountInputNotifier {
  @override
  AmountInputState build() {
    return AmountInputState();
  }

  void onChangeAmount(String? value) {
    String? cleanedString = value?.replaceAll(RegExp(r'[^0-9]'), '');
    state = state.copyWith(
        amount:
            isTruthy(cleanedString) ? num.parse(cleanedString ?? '0') : null);
    ;
  }
}
