extension NumberExtension on num? {
  String get convertToPercentage =>
      ((this ?? 0) * 10).toStringAsFixed(0) + ' %';
}
