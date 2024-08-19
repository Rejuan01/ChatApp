import 'package:chat_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/rounded_button.dart';
import '../../../view_model/controller/login_controller.dart';

class LoginButton extends StatelessWidget {
  LoginButton({super.key, required this.formKey});
  final LoginController controller = Get.find<LoginController>();
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(
          height: 45,
          text: controller.toLogin.value ? 'Login' : 'Sign up',
          isLoading: controller.isLoading.value,
          callback: () {
            if (formKey.currentState!.validate()) {
              controller.toLogin.value
                  ? controller.login()
                  : controller.signup();
            }
          },
        ));
  }
}
