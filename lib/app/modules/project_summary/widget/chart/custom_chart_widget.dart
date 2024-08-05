import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../common/color_manager.dart';
import '../../../../../common/strings.dart';
import '../../controllers/project_summary_controller.dart';
import 'custom_bar_chart_group_data.dart';

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
          SizedBox(height: 24.h),
          AspectRatio(
              aspectRatio: 1.6,
              child: Obx(() => BarChart(
                    BarChartData(
                      barTouchData: controller.barTouchData,
                      titlesData: controller.titlesData,
                      borderData: FlBorderData(show: false),
                      barGroups: controller.barGroups.map((index) {
                        final isSelected =
                            controller.selectedGroupIndex.value ==
                                controller.barGroups.indexOf(index);
                        return customBarChartGroupData(
                            toY: index.h, isSelected: isSelected);
                      }).toList(),
                      gridData: const FlGridData(show: false),
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 100.h,
                    ),
                  ))),
        ],
      ),
    );
  }
}
