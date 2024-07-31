import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_mvc_templet/common/color_manager.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;

  final String? svgImage;
  final Widget text;
  final Color? buttonColor;
  final double? verticalPadding;
  final double? horizontalPadding;

  final double? borderWidth;
  final Color? borderColor;

  const CustomButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.svgImage,
      this.buttonColor,
      this.verticalPadding,
      this.borderWidth,
      this.borderColor,
      this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(
                vertical: verticalPadding ?? 16.w,
                horizontal: horizontalPadding ?? 16.w),
          ),
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.disableColor; // Background color when disabled
            }
            return buttonColor ??
                AppColors.white; // Background color when enabled
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
              side: BorderSide(
                  color: borderColor ?? AppColors.borderColor,
                  width: borderWidth ?? 1.5.w),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (svgImage != null)
              SvgPicture.asset(
                svgImage!,
                width: 24.w,
                height: 24.h,
              ),
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: text,
            ))
          ],
        ));
  }
}
