import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart' as intl;
import '../../../../../common/color_manager.dart';
import '../../controllers/calendar_controller.dart';

class DaySubsequentListItem extends GetView<CalendarController> {
  const DaySubsequentListItem(
      {super.key, required this.day, required this.isSelected});

  final DateTime day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => controller.onDaySelected(day: day),
        child: Container(
          width: 48.w,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.black : AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                intl.DateFormat.E().format(day),
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.hintColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                intl.DateFormat.d().format(day),
                style: TextStyle(
                  color: isSelected ? AppColors.white : AppColors.textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.w,
                ),
              ),
            ],
          ),
        ));
  }
}
