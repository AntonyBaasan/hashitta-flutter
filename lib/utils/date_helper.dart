class DateHelper {
  // create static method that converts Duration to String
  static String durationToString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    final buffer = StringBuffer();
    if (duration.inHours > 0) {
      buffer.write("${twoDigits(duration.inHours)} hour ");
    }
    if (buffer.isNotEmpty || duration.inMinutes > 0) {
      buffer.write("$twoDigitMinutes min ");
    }
    buffer.write("$twoDigitSeconds sec");
    return buffer.toString();
  }
}
