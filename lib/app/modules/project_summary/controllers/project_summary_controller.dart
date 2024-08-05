import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../common/color_manager.dart';
import '../widget/chart/bottom_titles.dart';
import '../widget/chart/custom_bar_chart_group_data.dart';

class ProjectSummaryController extends GetxController {
  final searchController = TextEditingController();
  final selectedGroupIndex = (-1).obs;

  List<int> get barGroups => [
        60,
        80,
        40,
        56,
        70,
        75,
      ];

  FlTitlesData get titlesData => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  BarTouchData get barTouchData => BarTouchData(
        touchCallback: (event, response) {
          if (response?.spot != null && event.isInterestedForInteractions) {
            selectedGroupIndex.value = response!.spot!.touchedBarGroupIndex;
          }
        },
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => AppColors.textColor,
          tooltipPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          tooltipMargin: 14.h,
          tooltipRoundedRadius: 8.r,
          fitInsideHorizontally: true,
          getTooltipItem: (
            group,
            groupIndex,
            rod,
            rodIndex,
          ) {
            return BarTooltipItem(
                "${rod.toY.round()} %",
                TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
                children: []);
          },
        ),
      );
}

