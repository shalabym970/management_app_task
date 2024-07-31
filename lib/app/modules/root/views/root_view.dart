import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc_templet/common/color_manager.dart';

import '../../../../common/widgets/custom_bottom_nav_bar.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        // drawer: Drawer(
        //   child: MainDrawerWidget(),
        //   elevation: 0,
        // ),
        body: controller.currentPage,
        bottomNavigationBar: CustomBottomNavigationBar(
          backgroundColor: context.theme.scaffoldBackgroundColor,
          itemColor: context.theme.colorScheme.secondary,
          currentIndex: controller.currentIndex.value,
          onChange: (index) {
            controller.changePage(index);
          },
          children: [
            CustomBottomNavigationItem(
              icon: Icons.home_outlined,
              color: AppColors.textColor,
            ),
            CustomBottomNavigationItem(
              icon: Icons.assignment_outlined,
              color: AppColors.textColor,
            ),
            CustomBottomNavigationItem(
              icon: Icons.chat_outlined,
              color: AppColors.textColor,
            ),
            CustomBottomNavigationItem(
              icon: Icons.person_outline,
              color: AppColors.textColor,
            ),
          ],
        ),
      );
    });
  }
}
