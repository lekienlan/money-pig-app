import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/app/provider/app_start_provider.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartNotifierProvider);

    return state.when(
      data: (data) => SizedBox(
        child: Text(dotenv.env['ENV']!),
      ),
      error: (e, st) => SizedBox(),
      loading: () => SizedBox(),
    );
  }
}
