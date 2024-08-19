import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controller/profile_controller.dart';

class AboutFormField extends StatelessWidget {
  AboutFormField({super.key});
  final controller = Get.find<ProfileController>();
  final height = Get.height;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.statusController.value,
      //initialValue: userModel.about,
      validator: (value) =>
          value != null && value.isNotEmpty ? null : 'Required Field',
      decoration: InputDecoration(
          hintText: 'eg. Feeling great!',
          prefixIcon: const Icon(Icons.info),
          label: const Text('Status'),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(height * 0.03),
          )),
    );
  }
}
