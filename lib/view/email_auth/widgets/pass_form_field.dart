import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/controller/login_controller.dart';

class PasswordFormField extends StatelessWidget {
  PasswordFormField({super.key});
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.passwordController.value,
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter a password';
        }
        if (value.length < 4) {
          return 'Minimum 4 characters are required';
        }
        return null;
      },
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.key),
          hintText: 'Password',
          border: UnderlineInputBorder()),
    );
  }
}
