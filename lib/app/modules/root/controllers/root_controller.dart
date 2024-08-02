import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc_templet/app/modules/calendar/views/calendar_view.dart';
import 'package:getx_mvc_templet/app/modules/project_summary/views/project_summary_view.dart';
import '../../../../common/strings.dart';
import '../../../routes/app_routes.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;
  final notificationsCount = 0.obs;

  List<Widget> pages = [
    Container(),
    const ProjectSummaryView(),
    const CalendarView(),
    Container(),
  ];
  List<String> pagesTile = [
    AppStrings.category,
    AppStrings.projectSummary,
    AppStrings.calendar,
    AppStrings.profile,
  ];

  Widget get currentPage => pages[currentIndex.value];

  String get currentTitle => pagesTile[currentIndex.value];

  /// change page in route

  Future<void> changePageInRoot(int index) async {
    currentIndex.value = index;
  }

  Future<void> changePageOutRoot(int index) async {
    currentIndex.value = index;

    await Get.offNamedUntil(Routes.root, (Route route) {
      if (route.settings.name == Routes.root) {
        return true;
      }
      return false;
    }, arguments: index);
  }

  Future<void> changePage(int index) async {
    if (Get.currentRoute == Routes.root) {
      await changePageInRoot(index);
    } else {
      await changePageOutRoot(index);
    }
  }
}
