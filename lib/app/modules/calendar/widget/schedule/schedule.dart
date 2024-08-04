import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_mvc_templet/app/modules/calendar/controllers/calendar_controller.dart';
import '../../../../../common/color_manager.dart';
import 'time_slot_card.dart';

class Schedule extends GetView<CalendarController> {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          shrinkWrap: false,
          primary: false,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('09:00',
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500)),
                SizedBox(width: 7.w),
                TimeSlotCard(
                  timeSlot: controller.timeSlots[0],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                const Text('10:00'),
                SizedBox(width: 7.w),
                Container(
                  width: 288,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ],
            ),
            SizedBox(height: 55.h),
            Row(
              children: [
                Text('10:40',
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w700)),
                SizedBox(width: 7.w),
                Container(
                  width: 5.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.white, // Fill color
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0.w,
                    ),
                  ),
                ),
                Container(
                  width: 288,
                  height: 1,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 23.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('11:00',
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500)),
                SizedBox(width: 7.w),
                TimeSlotCard(
                  timeSlot: controller.timeSlots[1],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '12:00',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 7.w),
                TimeSlotCard(
                  timeSlot: controller.timeSlots[2],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text('13:00',
                    style: TextStyle(
                        fontSize: 12.sp, fontWeight: FontWeight.w500)),
                SizedBox(width: 7.w),
                Container(
                  width: 288,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
