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
  return formattedValue;
}
