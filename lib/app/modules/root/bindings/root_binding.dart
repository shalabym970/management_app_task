import 'package:get/get.dart';
import 'package:getx_mvc_templet/app/modules/calendar/controllers/calendar_controller.dart';
import '../../project_summary/controllers/project_summary_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(
      () => RootController(),
    );
    Get.put(ProjectSummaryController(), permanent: true);
    Get.put(CalendarController(), permanent: true);
  }
}
