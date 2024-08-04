import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/color_manager.dart';
import 'custom_task_card.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        primary: false,
        shrinkWrap: false,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: const CustomCard(
              topText: 'Meeting Concept',
              bottomText: 'Due Date: Mon, 12 Jan 2023',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: const CustomCard(
              topText: 'Information Architecture',
              bottomText: 'Due Date: Mon, 12 Jan 2023',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: const CustomCard(
              topText: 'Monitoring Project',
              bottomText: 'Due Date: Mon, 12 Jan 2023',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: const CustomCard(
              topText: 'Daily Standup',
              bottomText: 'Due Date: Mon, 12 Jan 2023',
            ),
          ),
        ],
      ),
    );
  }
}
