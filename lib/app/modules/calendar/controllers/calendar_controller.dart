import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final focusedDay = DateTime.now().obs;

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
