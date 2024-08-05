import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/color_manager.dart';

BarChartGroupData customBarChartGroupData(
    {required double toY, required bool isSelected}) {
  return BarChartGroupData(x: 0, barRods: [
    BarChartRodData(
      toY: toY,
      gradient: isSelected
          ? const LinearGradient(
              colors: [
                AppColors.textColor,
                AppColors.textColor,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )
          : LinearGradient(
              colors: [
                AppColors.chartDisableColor.withOpacity(0.12),
                AppColors.chartDisableColor.withOpacity(0.06),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
      width: 48.w,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(8.r),
        topRight: Radius.circular(8.r),
      ),
    )
  ]);
}
