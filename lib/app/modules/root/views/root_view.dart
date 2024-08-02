import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_mvc_templet/common/color_manager.dart';
import '../../../../common/widgets/custom_bottom_nav_bar.dart';
import '../../../../generated/assets.dart';
import '../controllers/root_controller.dart';
import '../widgets/custom_appbar.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: Column(
          children: [
            CustomAppbar(title: controller.currentTitle),
            Expanded(
              child: controller.currentPage,
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              enableSvgImage: Assets.iconsCategory, disableSvgImage: Assets.iconsCategory,
            ),
            CustomBottomNavigationItem(
              enableSvgImage: Assets.iconsFolder, disableSvgImage:Assets.iconsFolderLight,
            ),
            CustomBottomNavigationItem(
              disableSvgImage: Assets.iconsCalendarIcon, enableSvgImage:Assets.iconsCalendar,
            ),
            CustomBottomNavigationItem(
              enableSvgImage: Assets.iconsProfileIcon, disableSvgImage:  Assets.iconsProfileIcon,
            ),
          ],
        ),
      );
    });
  }
}
