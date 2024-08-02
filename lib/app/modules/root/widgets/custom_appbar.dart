import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/color_manager.dart';
import '../../../../generated/assets.dart';

class CustomAppbar extends StatelessWidget {
  final String title;

  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      margin: EdgeInsets.only(top: 24.h),
      height: 80.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor, // Border color
            width: 1.5.w, // Border width
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.iconsMenu,
                width: 24.w,
                height: 24.h,
              ),
              SizedBox(width: 24.w),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              SvgPicture.asset(
                Assets.iconsNotification,
                width: 40.w,
                height: 40.h,
              ),
              Positioned(
                top: 1.0,
                right: 6.0,
                child: Container(
                  width: 12.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                    color: AppColors.darkRed, // Circle color
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white, // Border color
                      width: 1.5.w, // Border width
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
