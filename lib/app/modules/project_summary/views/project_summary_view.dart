import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_mvc_templet/common/widgets/custom_button.dart';
import '../../../../common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_text_form.dart';
import '../../../../generated/assets.dart';
import '../controllers/project_summary_controller.dart';
import '../widget/chart/custom_chart_widget.dart';
import '../widget/status_card.dart';

class ProjectSummaryView extends GetView<ProjectSummaryController> {
  const ProjectSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
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
              ],
            ),
          ),
          SizedBox(height: 24.h),
          const CustomChartWidget()
        ],
      ),
    ));
  }
}
