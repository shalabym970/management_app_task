import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../helpers/validator.dart';

class LoginController extends GetxController {
  final emailAndPasswordValidation = EmailAndPasswordValidation();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isSubmitted = false.obs;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final loginKey = GlobalKey<FormState>();
  final hiddenPass = true.obs;
  var isFormValid = false.obs;

  String get _email => emailController.text;

  String get _password => passwordController.text;

  void onEmailEditingComplete(BuildContext context) {
    final newFocus =
        emailAndPasswordValidation.passwordValidator.isValid(_email)
            ? passwordFocusNode
            : emailFocusNode;
    FocusScope.of(context).requestFocus(newFocus);
  }

  void checkFormValid() {
    isFormValid.value = _email.isNotEmpty && _password.isNotEmpty;
  }

  void login() {}

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(checkFormValid);
    passwordController.addListener(checkFormValid);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    super.onClose();
  }
}
