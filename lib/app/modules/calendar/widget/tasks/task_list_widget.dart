import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_mvc_templet/app/modules/calendar/controllers/calendar_controller.dart';
import '../../../../../common/color_manager.dart';
import '../../../../models/task_model.dart';
import 'custom_task_card.dart';

class TaskListWidget extends GetView<CalendarController> {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          primary: false,
          shrinkWrap: true,
          itemCount: controller.tasks.length,
          itemBuilder: ((_, index) {
            Task task = controller.tasks.elementAt(index);
            return Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: CustomTaskCard(task: task),
            );
          }),
        ));
  }
}
