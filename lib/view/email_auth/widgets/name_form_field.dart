import 'package:chat_app/view_model/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameFormField extends StatelessWidget {
  NameFormField({super.key});
  final LoginController controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.nameController.value,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Username';
        }
        if (value.length < 4) {
          return 'Minimum 4 characters are required';
        }
        return null;
      },
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          hintText: 'Username',
          border: UnderlineInputBorder()),
    );
  }
}
