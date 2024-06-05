import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/transaction_model.dart';
import 'package:money_pig/presentation/transaction/provider/transaction_listing_provider.dart';
import 'package:money_pig/presentation/transaction/widget/transaction_row_widget.dart';
import 'package:money_pig/shared/util/enum.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/widget/header_widget.dart';

class IncomeListingPage extends ConsumerStatefulWidget {
  const IncomeListingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IncomeListingPageState();
}

class _IncomeListingPageState extends ConsumerState<IncomeListingPage> {
  @override
  Widget build(BuildContext context) {
    final incomeListingNotifier =
        ref.watch(transactionListingNotifierProvider(TransactionParams(
      types: [
        TransactionTypeEnum.income,
      ],
    )));
    return Scaffold(
      appBar: HeaderWidget(
        title: 'income'.tr().capitalize(),
        background: Colors.transparent,
      ),
      body: incomeListingNotifier.maybeWhen(
        orElse: () => SizedBox(),
        data: (transactionListing) {
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: transactionListing.length,
                itemBuilder: (context, index) {
                  final transaction = transactionListing[index];

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TransactionRowWidget(
                          transaction: transaction,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
