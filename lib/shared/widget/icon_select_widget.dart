import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_pig/shared/theme/colors.gen.dart';
import 'package:money_pig/shared/util/helper.dart';
import 'package:money_pig/shared/util/icon_mapper.dart';

class IconSelectWidget extends ConsumerWidget {
  final IconData? icon;
  final double? size;
  final Function(String? key, IconData? icon)? onChange;

  const IconSelectWidget({
    super.key,
    this.icon,
    this.size,
    this.onChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: !isTruthy(onChange)
          ? null
          : () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return new AlertDialog(
                        insetPadding: EdgeInsets.zero,
                        contentPadding: EdgeInsets.zero,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        content: Builder(
                          builder: (_) => Container(
                              color: ColorName.white,
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height / 2,
                              child: CustomScrollView(
                                shrinkWrap: true,
                                slivers: [
                                  SliverGrid.builder(
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                      ),
                                      itemCount:
                                          IconMapper.iconList.entries.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final iconEntry = IconMapper
                                            .iconList.entries
                                            .elementAt(index);
                                        return IconButton(
                                          icon: Icon(iconEntry.value),
                                          onPressed: () {
                                            onChange!(
                                                iconEntry.key, iconEntry.value);
                                            Navigator.pop(context);
                                          },
                                          tooltip: iconEntry.key,
                                        );
                                      })
                                ],
                              )),
                        ));
                  });
            },
      child: Icon(
        icon,
        color: ColorName.white,
        size: size ?? 18,
      ),
    );
  }
}
