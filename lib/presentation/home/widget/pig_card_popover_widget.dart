import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:money_pig/shared/theme/app_text_style.dart';
import 'package:money_pig/shared/util/extension.dart';
import 'package:money_pig/shared/util/helper.dart';

class PigCardPopoverWidget extends StatelessWidget {
  final Function? onDelete;
  final Function? onEdit;
  const PigCardPopoverWidget({super.key, this.onDelete, this.onEdit});

  @override
  Widget build(BuildContext context) {
    // Define the menu items
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.edit,
        'text': 'edit'.tr().capitalize(),
        'onTap': onEdit,
      },
      // {
      //   'icon': Icons.reorder,
      //   'text': 'Rearrange',
      //   'onTap': () {
      //     // Navigator.of(context).pop();
      //     // Add your rearrange action here
      //   },
      // },
      {
        'icon': Icons.delete,
        'text': 'delete'.tr().capitalize(),
        'onTap': onDelete,
      },
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: menuItems.map((item) {
        return Center(
          child: ListTile(
            leading: Icon(item['icon']),
            title: Text(
              item['text'],
              style: AppTextStyle.bodyM(),
            ),
            onTap: () {
              Navigator.of(context).pop();
              if (isTruthy(item['onTap']))
                item['onTap'](); // Call the onTap callback defined in menuItems
            },
          ),
        );
      }).toList(),
    );
  }
}
