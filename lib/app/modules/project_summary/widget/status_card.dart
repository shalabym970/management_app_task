import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/color_manager.dart';

class StatusCard extends StatelessWidget {
  final Color firstColor;
  final Color secondColor;
  final int count;
  final String label;
  final String svgImage;

  const StatusCard(
      {super.key,
      required this.count,
      required this.label,
      required this.firstColor,
      required this.secondColor,
      required this.svgImage});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [firstColor, secondColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: secondColor, // Custom shadow color
              spreadRadius: 0.5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$count',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SvgPicture.asset(
                    svgImage,
                    height: 16.h,
                    width: 16.w,
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: Text(label,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 10.sp,
                      height: 1.3.h,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white.withOpacity(0.8),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.visible),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
