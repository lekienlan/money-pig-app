import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:money_pig/shared/util/helper.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    RegExp regex = RegExp(r'[^0-9]');

    double value = double.parse(newValue.text.replaceAll(regex, ''));

    String newText = formatCurrency(value);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length - 1));
  }
}
