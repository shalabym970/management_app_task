import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../controllers/calendar_controller.dart';
import 'day_subsequent_list_item_widget.dart';

class DaySubsequentListWidget extends GetView<CalendarController> {
  const DaySubsequentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.h, // Adjust the height as needed
      child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.daysInMonth.length,
            itemBuilder: (context, index) {
              final day = controller.daysInMonth[index];
              final isSelected =
                  controller.isSameDay(day, controller.selectedDay.value);
              return DaySubsequentListItem(
                day: day,
                isSelected: isSelected,
              );
            },
          )),
    );
  }
}
