import 'package:easy_localization/easy_localization.dart';
import 'package:money_pig/data/local/local_pig_service.dart';
import 'package:money_pig/domain/model/pig_model.dart';
import 'package:money_pig/domain/model/style_model.dart';
import 'package:money_pig/presentation/home/provider/pig_listing_provider.dart';
import 'package:money_pig/presentation/new_pig/state/new_pig_state.dart';
import 'package:money_pig/presentation/transaction/provider/income_provider.dart';
import 'package:money_pig/router/app_router.dart';
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
        name: null, startDate: currentDate.toIso8601String(), icon: 'sports');
  }

  String renderTitle(int index) {
    if (index == 0) return 'pig_name'.tr();
    if (index == 1) return 'budget'.tr();
    if (index == 2) return 'time_range'.tr();
    return 'complete'.tr();
  }

  bool isEnabled(int index) {
    if (index == 0 && isTruthy(state.name)) return true;
    if (index == 1 && isTruthy(state.budget)) return true;
    if (index == 2 && isTruthy(state.startDate)) return true;
    return false;
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

  void onChangeIcon(String? key) {
    state = state.copyWith(icon: key);
  }

  Future<void> handleSubmit() async {
    try {
      state = state.copyWith(isSubmitting: true);
      LocalPigService().createPig(PigModel(
        name: state.name,
        budget: state.budget,
        start_date: state.startDate,
        end_date: state.endDate,
        style: StyleModel(icon: state.icon),
      ));

      await Future.delayed(Duration(milliseconds: 200));
      state = state.copyWith(isSubmitting: false);
      ref.invalidate(pigListingNotifierProvider);
      ref.invalidate(incomeNotifierProvider);
      ref.read(routerProvider).go(HomeRoute.path);
    } catch (err) {}
  }
}
