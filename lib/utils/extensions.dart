extension DateTimeFormatting on DateTime {
  String get formattedWeekday => [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ][weekday - 1];

  String get formattedDate => '${_monthName(month)} $day, $year';

  String _monthName(int month) => [
    '',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ][month];
}
