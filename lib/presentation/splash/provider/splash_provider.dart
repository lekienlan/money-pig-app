import 'package:money_pig/presentation/splash/state/splash_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  FutureOr<SplashState> build() async {
    ref.onDispose(() {});

    await Future.delayed(Duration(seconds: 1));

    return SplashState.authenticated();
  }
}
