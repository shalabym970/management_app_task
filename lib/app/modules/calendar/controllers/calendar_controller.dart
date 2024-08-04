import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_manager.dart';
import '../../../models/task_model.dart';
import '../../../models/time_slot_model.dart';

class CalendarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;
  final daysInMonth = <DateTime>[].obs;

  final List<TimeSlot> timeSlots = [
    TimeSlot(
        eventName: "Sprint Review Period 02 in May 2022",
        eventTime: "09:00 AM - 10:00 AM",
        backgroundColor: AppColors.lightPurple,
        markColor: AppColors.darkPurple),
    TimeSlot(
        eventName: "Meeting with Client",
        eventTime: "11:00 AM - 12:00 AM",
        backgroundColor: AppColors.lightOrange,
        markColor: AppColors.darkOrange),
    TimeSlot(
        eventName: "Daily Standup",
        eventTime: "12:00 AM - 12:30 PM",
        backgroundColor: AppColors.lightGreen,
        markColor: AppColors.darkGreen),
  ];

  final List<Task> tasks = [
    Task(title: 'Meeting Concept', date: 'Due Date: Mon, 12 Jan 2023'),
    Task(title: 'Information Architecture', date: 'Due Date: Mon, 12 Jan 2023'),
    Task(title: 'Monitoring Project', date: 'Due Date: Mon, 12 Jan 2023'),
    Task(title: 'Daily Standup', date: 'Due Date: Mon, 12 Jan 2023'),
  ];

  void generateDaysInMonth({required DateTime date}) {
    final lastDay = DateTime(date.year, date.month + 1, 0);

    daysInMonth.value = List<DateTime>.generate(
      lastDay.day,
      (i) => DateTime(date.year, date.month, i + 1),
    );
  }

  void onDaySelected({required DateTime day}) {
    selectedDay.value = day;
    focusedDay.value = day;
    generateDaysInMonth(date: selectedDay.value);
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  void selectPreviousDay() {
    if (daysInMonth.isNotEmpty) {
      int currentIndex = daysInMonth.indexOf(selectedDay.value);
      if (currentIndex > 0) {
        selectedDay.value = daysInMonth[currentIndex - 1];
        focusedDay.value = selectedDay.value;
        generateDaysInMonth(date: selectedDay.value);
      }
    }
  }

  void selectNextDay() {
    if (daysInMonth.isNotEmpty) {
      int currentIndex = daysInMonth.indexOf(selectedDay.value);
      if (currentIndex < daysInMonth.length - 1) {
        selectedDay.value = daysInMonth[currentIndex + 1];
        focusedDay.value = selectedDay.value;
        generateDaysInMonth(date: selectedDay.value);
      }
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    generateDaysInMonth(date: selectedDay.value);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
