import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'day_subsequent_container.dart';

class DaySubsequentListWidget extends StatelessWidget {
  const DaySubsequentListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          DaySubsequentContainer(day: 'TUE', date: '13'),
          DaySubsequentContainer(day: 'WED', date: '14'),
          DaySubsequentContainer(day: 'THU', date: '15'),
          DaySubsequentContainer(day: 'FRI', date: '16'),
          DaySubsequentContainer(day: 'SAT', date: '17'),
          DaySubsequentContainer(day: 'SUN', date: '18'),
        ],
      ),
    );
  }
}
