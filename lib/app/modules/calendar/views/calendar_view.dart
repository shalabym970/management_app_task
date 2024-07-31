import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Container()),
    );
  }
}
