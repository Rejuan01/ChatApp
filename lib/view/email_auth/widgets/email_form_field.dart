import 'package:chat_app/view_model/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailFormField extends StatelessWidget {
  EmailFormField({super.key});
  final LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.emailController.value,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter email';
        }
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(value)) {
          return 'Enter a valid email';
        }
        return null;
      },
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email),
          hintText: 'Email',
          border: UnderlineInputBorder()),
    );
  }
}
