import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/shared/theme/app_shadow.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/widget/header_widget.dart';
import 'package:remixicon/remixicon.dart';

class EastlinPage extends ConsumerWidget {
  const EastlinPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promos = [
      _PromoCard(
        title: 'McDonald',
        image: 'https://i.ytimg.com/vi/txL-RL1D4Mg/maxresdefault.jpg',
      ),
      _PromoCard(
        title: 'Boba Zilla',
        image:
            'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgKjc_iF75g1xSwGO428i7dIVDRgC4a-VDbPmlpe8c5p2S3OdzF9ltm0RhyrXkKEIWVznZfixlE2ldvPKsAizVlCr8WMJgCCFjmDyFPPt2Vz35IPXtCKgP5HQcbpMnaDRMVGnVrqxLBw3r5/s1080/BOBA+ZILLA+Promo+Beli+1+Gratis+1+Mango+Chizu.jpg',
      )
    ];
    return Container(
      child: Scaffold(
        backgroundColor: ColorName.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          toolbarHeight: 40,
          leading: Container(
            padding: EdgeInsets.only(left: 16),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.textBorder),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Remix.search_2_line,
                size: 18,
              ),
            ),
          ),
          actions: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: ColorName.textBorder),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Remix.notification_2_fill,
                size: 18,
              ),
            ),
            SizedBox(
              width: 16,
            ),
          ],
          title: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Current location',
                    style: AppTextStyle.bodyS(color: ColorName.textBorder)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Remix.map_pin_fill,
                        color: ColorName.green500, size: 18),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Ho Chi Minh, Vietnam',
                        style: AppTextStyle.heading2XS())
                  ],
                )
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    'https://assets.grab.com/wp-content/uploads/sites/8/2019/12/12183850/hero_banner_1950x700.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverGrid.count(
                mainAxisSpacing: 4,
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                children: [
                  _CategoryButton(
                    title: 'Offers',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/6713/6713699.png',
                  ),
                  _CategoryButton(
                    title: 'Chicken',
                    image:
                        'https://cdn-icons-png.freepik.com/512/4537/4537349.png',
                  ),
                  _CategoryButton(
                    title: 'Rice',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/1531/1531385.png',
                  ),
                  _CategoryButton(
                    title: 'Burger',
                    image:
                        'https://static.vecteezy.com/system/resources/previews/019/615/986/original/hamburger-color-icon-png.png',
                  ),
                  _CategoryButton(
                    title: 'Pizza',
                    image:
                        'https://static.vecteezy.com/system/resources/previews/018/974/743/original/pizza-slice-icon-png.png',
                  ),
                  _CategoryButton(
                    title: 'Coffee',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/4856/4856718.png',
                  ),
                  _CategoryButton(
                    title: 'Boba',
                    image:
                        'https://cdn-icons-png.freepik.com/256/3081/3081162.png?semt=ais_hybrid',
                  ),
                  _CategoryButton(
                    title: 'Salad',
                    image:
                        'https://cdn-icons-png.flaticon.com/512/2515/2515263.png',
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Text('Featured', style: AppTextStyle.headingXS()),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: promos.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: 16),
                          promos[index],
                        ],
                      );
                    }),
              ),
            )
          ],
        ),
        bottomNavigationBar: _NavBar(),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String? image;
  final String? title;
  const _CategoryButton({super.key, this.image, this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      color: ColorName.surfaceSecondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: ColorName.white),
              child: Image.network(image ?? '')),
          SizedBox(height: 4),
          Text(
            title ?? '',
            style: AppTextStyle.heading2XS(),
          )
        ],
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String? image;
  final String? title;
  final String? description;
  const _PromoCard({super.key, this.image, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              image ?? '',
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(title ?? '', style: AppTextStyle.heading2XS()),
        ],
      ),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: 54,
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        boxShadow: [AppShadow.normal],
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
            unselectedFontSize: 0,
            selectedFontSize: 0,
            selectedItemColor: ColorName.white,
            unselectedItemColor: ColorName.textTertiary,
            backgroundColor: ColorName.textSecondary,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Remix.home_5_fill), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Remix.search_2_line), label: ''),
              BottomNavigationBarItem(icon: Icon(Remix.heart_line), label: ''),
              BottomNavigationBarItem(icon: Icon(Remix.user_line), label: ''),
            ]),
      ),
    ));
  }
}
