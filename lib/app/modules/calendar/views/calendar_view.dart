import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_mvc_templet/common/strings.dart';
import '../../../../common/color_manager.dart';
import '../controllers/calendar_controller.dart';
import '../widget/custom_calendar.dart';
import '../widget/day_subsequent_list/day_subsequent_list_widget.dart';
import '../widget/schedule/schedule.dart';
import '../widget/tasks/task.dart';
import 'package:intl/intl.dart' as intl;

class CalendarView extends GetView<CalendarController> {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 26.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            Obx(() => Text(
                  "${intl.DateFormat('MMMM').format(controller.selectedDay.value)} ${controller.selectedDay.value.year}",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            IconButton(
              icon: Transform.rotate(
                angle: 90 *
                    3.141592653589793 /
                    180, // Convert 90 degrees to radians
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.sp,
                ),
              ),
              onPressed: () {
                showCustomBottomSheet(context);
              },
            ),
            const Spacer(), // Spacer to push the icons to the right
            Container(
              width: 32.w,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.arrow_back_ios_rounded, size: 16.sp),
            ),
            SizedBox(width: 8.w),
            Container(
              width: 32.w,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderColor,
                  width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.arrow_forward_ios_outlined, size: 16.sp),
            ),
          ],
        ),
      ),
      SizedBox(height: 26.h),
      const DaySubsequentListWidget(),
      SizedBox(height: 24.h),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: TabBar(
          controller: controller.tabController,
          tabs: [
            Tab(
              child: Text(
                AppStrings.schedule,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
              ),
            ),
            Tab(
              child: Text(
                AppStrings.task,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.sp),
              ),
            ),
          ],
          labelColor: AppColors.textColor,
          indicatorColor: AppColors.textColor,
          unselectedLabelColor: AppColors.hintColor,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      Expanded(
        child: TabBarView(
          controller: controller.tabController,
          children: const [
            Schedule(),
            Task(),
          ],
        ),
      ),
    ]));
  }
}
