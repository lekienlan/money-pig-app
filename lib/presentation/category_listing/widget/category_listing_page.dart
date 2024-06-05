import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/domain/model/category_model.dart';
import 'package:money_pig/presentation/category_listing/provider/category_listing_provider.dart';
import 'package:money_pig/presentation/category_listing/widget/category_item_widget.dart';
import 'package:money_pig/router/app_router.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/widget/navigation_bar_widget.dart';

class CategoryListingPage extends ConsumerStatefulWidget {
  const CategoryListingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoryListingPageState();
}

class _CategoryListingPageState extends ConsumerState<CategoryListingPage> {
  @override
  Widget build(BuildContext context) {
    final categoryListingNotifier =
        ref.watch(categoryListingNotifierProvider(CategoryParams()));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorName.surfaceSecondary,
        scrolledUnderElevation: 0.0,
        toolbarHeight: 0,
      ),
      bottomNavigationBar: NavigationBarWidget(),
      body: categoryListingNotifier.maybeWhen(
        orElse: () => SizedBox(),
        data: (categoryListing) {
          return CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: categoryListing.length,
                itemBuilder: (context, index) {
                  final category = categoryListing[index];

                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 40,
                          child: CategoryItemWidget(
                            isSelected: true,
                            onTap: () {
                              ref
                                  .read(routerProvider)
                                  .push(CategoryInputRoute.path);
                            },
                            category: category,
                          ),
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
