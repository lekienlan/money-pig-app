import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return ''; // Handle empty string
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String toDate() {
    if (isEmpty) return '';
    final date = DateTime.parse(this).toLocal();
    return DateFormat('dd MMMM, yyyy', 'vi').format(date);
  }
}
