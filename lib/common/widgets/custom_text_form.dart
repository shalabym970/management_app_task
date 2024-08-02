import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../color_manager.dart';

class CustomTextForm extends StatelessWidget {
  final String hintText;

  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? svgImage;
  final bool isHidden;
  final void Function()? onHidden;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? Function(String?)? validator;

  const CustomTextForm(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.keyboardType,
      required this.validator,
      this.isPassword = false,
      this.isHidden = true,
      this.onHidden,
      required this.label,
      this.focusNode,
      this.svgImage,
      this.onEditingComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        controller: controller,
        obscureText: isPassword ? isHidden : false,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor)),
          label: Text(label),
          hintText: hintText,
          hintStyle: TextStyle(
              color: AppColors.hintColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 10.h),
          suffixIcon: isPassword
              ? InkWell(
                  onTap: onHidden,
                  child: Icon(
                    isHidden
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.hintColor,
                    size: 24.sp,
                  ))
              : svgImage != null
                  ? Transform.scale(
                      scale: 0.5.h,
                      child: SvgPicture.asset(
                        svgImage!,
                      ),
                    )
                  : null,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode);
  }
}
