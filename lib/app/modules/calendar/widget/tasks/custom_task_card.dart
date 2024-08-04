import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/color_manager.dart';

class CustomCard extends StatefulWidget {
  final String topText;
  final String bottomText;

  const CustomCard({
    super.key,
    required this.topText,
    required this.bottomText,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 76.h,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r), // Curve all edges
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 7,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  widget.topText,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor,
                      fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 4.h), // Space between the texts
              Expanded(
                child: Text(
                  widget.bottomText,
                  style: TextStyle(
                      color: AppColors.disableIconColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Checkbox(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false; // Update the state
              });
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)),
            checkColor: AppColors.white,
            activeColor: AppColors.checkBoxGreen,
          )
        ],
      ),
    );
  }
}
