extension StringRemoveUnderscoreExtension on String {
  String removeUnderscores() {
    if (contains('_')) {
      return replaceAll('_', ' ');
    }
    return this;
  }
}

extension StringCasingExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
