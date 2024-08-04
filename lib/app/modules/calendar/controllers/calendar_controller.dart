import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/color_manager.dart';
import '../../../models/time_slot_model.dart';

class CalendarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final focusedDay = DateTime.now().obs;
  final selectedDay = DateTime.now().obs;

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

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
