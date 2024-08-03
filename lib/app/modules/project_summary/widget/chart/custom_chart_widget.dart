import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/strings.dart';
import '../../controllers/project_summary_controller.dart';

class CustomChartWidget extends GetView<ProjectSummaryController> {
  const CustomChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.productivity,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
              ),
              Icon(Icons.more_horiz_outlined, size: 24.sp)
            ],
          ),
          SizedBox(height: 8.h),
          AspectRatio(
              aspectRatio: 1.6,
              child: BarChart(
                BarChartData(
                  barTouchData: controller.barTouchData,
                  titlesData: controller.titlesData,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: controller.barGroups,
                  gridData: const FlGridData(show: false),
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 100,
                ),
              )),
        ],
      ),
    );
  }
}
