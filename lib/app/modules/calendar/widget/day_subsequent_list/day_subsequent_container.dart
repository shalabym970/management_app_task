import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/color_manager.dart';

class DaySubsequentContainer extends StatelessWidget {
  const DaySubsequentContainer({super.key, required this.day, required this.date});
final String day;
final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              color: AppColors.hintColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            date,
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w700,
              fontSize: 16.w,
            ),
          ),
        ],
      ),
    );
    ;
  }
}
