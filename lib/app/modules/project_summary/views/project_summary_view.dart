import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_mvc_templet/common/widgets/custom_button.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_text_form.dart';
import '../../../../generated/assets.dart';
import '../controllers/project_summary_controller.dart';
import '../widget/status_card.dart';

class ProjectSummaryView extends GetView<ProjectSummaryController> {
  const ProjectSummaryView({super.key});

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: AppColors.contentColorCyan,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget bottomTitles(double value, TitleMeta meta) {
    TextStyle style = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;

      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          AppColors.chartDisableColor.withOpacity(0.12),
          AppColors.chartDisableColor.withOpacity(0.06),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(toY: 60, gradient: _barsGradient, width: 48.w)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(toY: 80, gradient: _barsGradient, width: 48.w)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(toY: 40, gradient: _barsGradient, width: 48.w)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(toY: 56, gradient: _barsGradient, width: 48.w)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(toY: 70, gradient: _barsGradient, width: 48.w)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(toY: 75, gradient: _barsGradient, width: 48.w)
            ],
            showingTooltipIndicators: [0],
            barsSpace: 20.0),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                ),
                CustomTextForm(
                  hintText: AppStrings.searchProject,
                  validator: (String? value) {},
                  keyboardType: TextInputType.text,
                  controller: controller.searchController,
                  label: AppStrings.search,
                  svgImage: Assets.iconsSearchNormal,
                ),
                SizedBox(height: 24.h),

                Row(
                  children: [
                    StatusCard(
                      count: 10,
                      label: AppStrings.projectInProgress,
                      svgImage: Assets.iconsClock,
                      firstColor: AppColors.darkBlue.withOpacity(1),
                      secondColor: AppColors.lightBlue.withOpacity(1),
                    ),
                    StatusCard(
                      count: 24,
                      label: AppStrings.projectCompleted,
                      svgImage: Assets.iconsVerify,
                      firstColor: AppColors.darkGreen.withOpacity(1),
                      secondColor: AppColors.lightGreen.withOpacity(1),
                    ),
                    StatusCard(
                      count: 5,
                      label: AppStrings.projectCancelled,
                      svgImage: Assets.iconsCloseCircle,
                      firstColor: AppColors.darkRed.withOpacity(1),
                      secondColor: AppColors.lightRed.withOpacity(1),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: Text(
                    AppStrings.viewAllProject,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor),
                  ),
                  buttonColor: AppColors.scaffoldBackground,
                  onPressed: () {},
                  borderColor: AppColors.black,
                  verticalPadding: 14.h,
                ),
                SizedBox(height: 24.h),
                Container(
                  color: AppColors.white,
                  child: AspectRatio(
                      aspectRatio: 1.6,
                      child: BarChart(
                        BarChartData(
                          barTouchData: barTouchData,
                          titlesData: titlesData,
                          borderData: borderData,
                          barGroups: barGroups,
                          gridData: const FlGridData(show: false),
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 100,
                        ),
                      )),
                ),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     StatusCard(color: color, count: count, label: label, icon: icon)
                //   ],
                // ),
                SizedBox(height: 16.0),

                SizedBox(height: 32.0),
                Text(
                  'Productivity',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                // Placeholder for productivity chart
                //  _buildProductivityChart(),
              ],
            ),
          )),
    );
  }
}
