class DateFormatter {
  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String formatDynamic(DateTime date) {
    DateTime now = DateTime.now();
    if (date.difference(now).inDays == 0) {
      return '${date.hour}:${date.minute}';
    }
    if (date.difference(now).inDays == 1) {
      return 'Yesterday ${date.hour}:${date.minute}';
    }
    return '${date.day}/${date.month}/${date.year}';
  }
}
