import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:money_pig/shared/util/constant.dart';

double dynamicFontSize({
  String text = '',
  double defaultFontSize = 24,
  int stepLength = 10,
  double scale = 0.9,
}) {
  int length = text.length;
  int spaceCount = RegExp(r' ').allMatches(text).length; // count spaces

  // Determine the steps based on text length
  int steps = ((length - spaceCount) / stepLength).ceil();

  // Calculate new font size
  double fontSize = defaultFontSize;
  for (int i = 1; i < steps; i += 1) {
    fontSize *= scale; // reduce font size by the scale factor
  }

  // Optional: set a minimum font size
  double minFontSize = 5;
  fontSize = fontSize.clamp(minFontSize, double.infinity);

  return fontSize;
}

String formatCurrency(num? value) {
  if (value == null) return 'N/A';
  int intValue = value.toInt();
  String formattedValue = intValue.toString();
  final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  formattedValue =
      formattedValue.replaceAllMapped(regex, (Match match) => '${match[1]}.');
  return "${formattedValue}đ";
}

bool isTruthy(dynamic value) {
  return value != null && value != false && value != 0 && value != '';
}

Future<String?> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id; // unique ID on Android
  }
  return null;
}

String sanitizeText(String? string) {
  return string
          ?.replaceAll(
              RegExp("[${RegExp.escape(SPECIAL_CHARACTERS)}]", multiLine: true),
              '')
          .trim() ??
      '';
}

bool isToday(DateTime date) {
  final now = DateTime.now();
  return date.year == now.year &&
      date.month == now.month &&
      date.day == now.day;
}

bool isSameDay(DateTime? date1, DateTime? date2) {
  return date1?.year == date2?.year &&
      date1?.month == date2?.month &&
      date1?.day == date2?.day;
}

String formatNumberWithSuffix(num? number) {
  if (!isTruthy(number)) return 'N/A';

  if (number! >= 1000000000) {
    return (number / 1000000000)
            .toStringAsFixed((number % 1000000000 == 0) ? 0 : 1) +
        'B';
  } else if (number >= 1000000) {
    return (number / 1000000).toStringAsFixed((number % 1000000 == 0) ? 0 : 1) +
        'M';
  } else if (number >= 1000) {
    return (number / 1000).toStringAsFixed((number % 1000 == 0) ? 0 : 1) + 'K';
  } else {
    return number.toString();
  }
}
