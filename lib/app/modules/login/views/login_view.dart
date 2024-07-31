import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getx_mvc_templet/common/color_manager.dart';
import '../../../../common/strings.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../generated/assets.dart';
import '../controllers/login_controller.dart';
import '../../../../common/widgets/custom_text_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 24.h,
              horizontal: 24.w,
            ),
            child: Form(
              key: controller.loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.login,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    AppStrings.signInYourAccount,
                    style: TextStyle(
                        color: AppColors.hintColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 40.h),
                  CustomTextFormAuth(
                    hintText: AppStrings.enterEmail,
                    validator: (String? value) {},
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    label: "${AppStrings.username} / ${AppStrings.email}",
                    onEditingComplete: () =>
                        controller.onEmailEditingComplete(context),
                    focusNode: controller.emailFocusNode,
                  ),
                  SizedBox(height: 14.h),
                  Obx(() => CustomTextFormAuth(
                        hintText: AppStrings.enterPassword,
                        isHidden: controller.hiddenPass.value,
                        onHidden: () => controller.hiddenPass.value =
                            !controller.hiddenPass.value,
                        validator: (String? value) {},
                        isPassword: true,
                        controller: controller.passwordController,
                        label: AppStrings.password,
                        focusNode: controller.passwordFocusNode,
                      )),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.forgotPassword,
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Obx(() => CustomButton(
                        text: Text(
                          AppStrings.login,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: AppColors.white),
                        ),
                        buttonColor: AppColors.textColor,
                        verticalPadding: 16.h,
                        onPressed: controller.isFormValid.value ?controller.login : null ,
                      )),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      AppStrings.orLoginWith,
                      style: TextStyle(
                          color: AppColors.hintColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    onPressed: () {},
                    svgImage: Assets.imagesGoogle,
                    text: Text(
                      AppStrings.continueWithGoogle,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.textColor),
                    ),
                    verticalPadding: 16.h,
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    onPressed: () {},
                    svgImage: Assets.imagesFacebook,
                    text: Text(
                      AppStrings.continueWithFacebook,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.textColor),
                    ),
                    verticalPadding: 16.h,
                  ),
                  SizedBox(height: 16.h),
                  CustomButton(
                    onPressed: () {},
                    svgImage: Assets.imagesApple,
                    text: Text(
                      AppStrings.continueWithApple,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: AppColors.textColor),
                    ),
                    verticalPadding: 16.h,
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.dontHaveAccount,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.hintColor,
                            ),
                          ),
                          TextSpan(
                            text: " ${AppStrings.register}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
