import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/color_manager.dart';
import '../../../../models/time_slot_model.dart';

class TimeSlotCard extends StatelessWidget {
  final TimeSlot timeSlot;

  const TimeSlotCard({
    super.key,
    required this.timeSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 288.w,
              height: 1,
              color: AppColors.borderColor,
            ),
            Container(
              width: 272.w,
              height: 64.h,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: timeSlot.backgroundColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      timeSlot.eventName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_filled_outlined,
                        color: AppColors.hintColor,
                        size: 16.sp,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          timeSlot.eventTime,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.hintColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 13.w,
          top: 0,
          bottom: 0,
          child: Container(
            width: 6.w, // Adjust width as needed
            height: 64.h,
            decoration: BoxDecoration(
              color: timeSlot.markColor, // Pink color for the left curve
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r), // Curved edge on top left
                bottomLeft: Radius.circular(8.r), // Curved edge on bottom left
              ),
            ),
          ),
        ),
      ],
    );
  }
}
