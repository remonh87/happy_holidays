extension DateTimeExtended on DateTime {
  String simpleDateTimeEuropean() => '$day-$month-$year';
  String simpleDateTimeUS() => '$year-$month-$day';
}
