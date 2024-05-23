import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/presentation/pig_detail/provider/pig_detail_provider.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';

import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/widget/header_widget.dart';

class PigDetailPage extends ConsumerStatefulWidget {
  final String? id;
  const PigDetailPage({this.id, super.key});

  @override
  PigDetailPageState createState() => PigDetailPageState();
}

class PigDetailPageState extends ConsumerState<PigDetailPage> {
  Widget build(BuildContext context) {
    final pigDetailNotifier =
        ref.watch(pigDetailNotifierProvider(widget.id ?? ''));
    return Scaffold(
      backgroundColor: ColorName.white,
      appBar: HeaderWidget(
        title: 'pig_detail'.tr().capitalize(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 12),
            pigDetailNotifier.when(
                data: (data) {
                  log('$data');
                  return Column(
                    children: [
                      Text(data.name ?? ''),
                      Text(data.budget?.toString() ?? ''),
                      Text(data.start_date?.toDate() ?? ''),
                    ],
                  );
                },
                loading: () => Text('loading'),
                empty: () => Text('empty'),
                error: () => Text('error'))
          ],
        ),
      ),
    );
  }
}
