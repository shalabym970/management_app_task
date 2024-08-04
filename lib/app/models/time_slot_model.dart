import 'dart:ui';

class TimeSlot {
  final String eventName;
  final String eventTime;
  final Color backgroundColor;
  final Color markColor;

  TimeSlot(
      {required this.eventName,
      required this.eventTime,
      required this.backgroundColor,
      required this.markColor});
}
