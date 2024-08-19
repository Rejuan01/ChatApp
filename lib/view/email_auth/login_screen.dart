import 'package:chat_app/res/colors/app_color.dart';
import 'package:chat_app/res/components/rounded_button.dart';
import 'package:chat_app/view/email_auth/widgets/email_form_field.dart';
import 'package:chat_app/view/email_auth/widgets/login_button.dart';
import 'package:chat_app/view/email_auth/widgets/name_form_field.dart';
import 'package:chat_app/view/email_auth/widgets/pass_form_field.dart';
import 'package:chat_app/view_model/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final LoginController controller = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Obx(
                      () => controller.toLogin.value
                          ? Container()
                          : EmailFormField(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    NameFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    PasswordFormField(),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            LoginButton(formKey: _formKey),
            const SizedBox(
              height: 20,
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    controller.toLogin.value
                        ? const Text("Don't have an account?")
                        : const Text("Already have an account?"),
                    RoundButton(
                      height: 30,
                      width: 50,
                      buttonColor: AppColor.secondaryButtonColor,
                      text: controller.toLogin.value ? 'Sign up' : 'Login in',
                      callback: () {
                        controller.changeLoginState();
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
