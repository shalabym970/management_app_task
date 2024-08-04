import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_mvc_templet/app/modules/calendar/controllers/calendar_controller.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:ui';
import '../../../../common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_button.dart';

class CustomCalendar extends GetView<CalendarController> {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Blur effect
            child: Container(),
          ),
        ),
        Container(
          height: 603.h,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.r),
            ),
          ),
          child: ListView(
            children: [
              SizedBox(height: 18.h),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Text(
                        AppStrings.chooseDate,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(flex: 1),
                      IconButton(
                          icon: Icon(Icons.close, size: 24.sp),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  )),
              SizedBox(height: 16.h),
              Divider(
                thickness: 1.5, // Line thickness
                color: AppColors.borderColor, // Line color
                height: 1.5.h, // Space around the divider
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(7, (index) {
                    final weekday =
                        DateFormat.E().dateSymbols.NARROWWEEKDAYS[index];
                    return Text(
                      weekday,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Obx(() => TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: controller.focusedDay.value,
                      selectedDayPredicate: (day) =>
                          isSameDay(day, controller.selectedDay.value),
                      daysOfWeekVisible: false,
                      weekNumbersVisible: false,
                      calendarStyle: CalendarStyle(
                          selectedTextStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                          defaultTextStyle: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                          selectedDecoration: const BoxDecoration(
                              color: Color(0xff191D2B), shape: BoxShape.circle),
                          todayDecoration: const BoxDecoration(
                            color: Color(0xff191D2B),
                            shape: BoxShape.circle,
                          ),
                          weekendTextStyle: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textColor)),
                      headerStyle: HeaderStyle(
                          titleTextStyle: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w600),
                          titleCentered: true,
                          formatButtonVisible: false),
                      onPageChanged: (focusedDay) {
                        controller.focusedDay.value = focusedDay;
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        controller.selectedDay.value = selectedDay;
                        controller.focusedDay.value = focusedDay;
                        controller.generateDaysInMonth(
                            date: controller.selectedDay.value);
                      },
                    )),
              ),
              Divider(
                thickness: 1.5, // Line thickness
                color: AppColors.borderColor, // Line color
                height: 1.5.h, // Space around the divider
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomButton(
                  text: Text(
                    AppStrings.continue_,
                    style: TextStyle(fontSize: 16.sp, color: AppColors.white),
                  ),
                  buttonColor: AppColors.textColor,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 48.h),
            ],
          ),
        ),
      ],
    );
  }
}

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => const CustomCalendar(),
  );
}
