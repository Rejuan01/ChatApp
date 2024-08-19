import 'package:chat_app/view_model/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsernameFormField extends StatelessWidget {
  UsernameFormField({super.key});
  final controller = Get.find<ProfileController>();
  final height = Get.height;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.usernameController.value,
      //initialValue: userModel.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Username';
        }
        if (value.length < 4) {
          return 'Minimum 4 characters are required';
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: 'eg. First Name',
          prefixIcon: const Icon(Icons.person),
          label: const Text('Username'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.03),
          )),
    );
  }
}
