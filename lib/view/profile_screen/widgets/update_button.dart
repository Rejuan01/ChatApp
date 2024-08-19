import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controller/profile_controller.dart';

class UpdateButton extends StatelessWidget {
  UpdateButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  final ProfileController controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton.icon(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            await controller.updateUserInfo();
          }
          await controller.updateProfilePicture();
        },
        icon: controller.isUpdating.value
            ? const SizedBox(
                height: 16, width: 16, child: CircularProgressIndicator())
            : const Icon(Icons.edit),
        label: controller.isUpdating.value
            ? const Text('Updating')
            : const Text('Update')));
  }
}
