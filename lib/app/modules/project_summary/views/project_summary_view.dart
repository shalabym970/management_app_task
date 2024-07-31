import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_mvc_templet/common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../generated/assets.dart';
import '../controllers/project_summary_controller.dart';
import '../../../../common/widgets/custom_text_form.dart';

class ProjectSummaryView extends GetView<ProjectSummaryController> {
  const ProjectSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container()
      ),
    );
  }
}
