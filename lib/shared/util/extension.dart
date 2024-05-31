import 'package:easy_localization/easy_localization.dart';
import 'package:money_pig/shared/util/enum.dart';

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return ''; // Handle empty string
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String toDate({String? format}) {
    if (isEmpty) return '';
    final date = DateTime.parse(this).toLocal();
    return DateFormat(format ?? 'dd MMMM, yyyy').format(date);
  }
}

extension TransactionTypeExtension on TransactionTypeEnum {
  String get stringValue {
    switch (this) {
      case TransactionTypeEnum.budget:
        return 'budget';
      case TransactionTypeEnum.expense:
        return 'expense';
      case TransactionTypeEnum.income:
        return 'income';
      default:
        return '';
    }
  }
}
