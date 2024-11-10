import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// day only
  String toDayOnly() {
    return DateFormat("E").format(toLocal());
  }

  /// date only
  String toDateOnly() {
    return DateFormat("d").format(toLocal());
  }

  /// month only
  String toMonthOnly() {
    return DateFormat("MMM").format(toLocal());
  }

  String toMonthDayYear() {
    return DateFormat("MMM d, y").format(toLocal());
  }
}
