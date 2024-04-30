import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/home/widget/home_page.dart';
import 'package:money_pig/presentation/splash/provider/splash_provider.dart';
import 'package:money_pig/shared/widget/loading_widget.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(splashNotifierProvider);

    return state.when(
      loading: () => LoadingWidget(),
      data: (data) => data.maybeWhen(
        authenticated: () => HomePage(),
        orElse: () => Text('not found'),
      ),
      error: (e, st) => SizedBox(),
    );
  }
}
