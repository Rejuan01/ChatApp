import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/user_model.dart';
import '../../../view_model/controller/profile_controller.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({super.key, required this.userModel});
  final UserModel userModel;
  final ProfileController controller = Get.find<ProfileController>();
  final double height = Get.height;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ClipRRect(
          borderRadius: BorderRadius.circular(height * 0.1),
          child: controller.pickedImageUrl.value != ''
              ? Image.file(
                  File(controller.pickedImageUrl.value),
                  height: height * 0.2,
                  width: height * 0.2,
                  fit: BoxFit.cover,
                )
              : userModel.image == ""
                  ? SizedBox(
                      height: height * 0.2,
                      width: height * 0.2,
                      child: CircleAvatar(
                        child: Text(
                          userModel.name[0],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.07),
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: userModel.image,
                      height: height * 0.2,
                      width: height * 0.2,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        child: Icon(Icons.error),
                      ),
                    ),
        ));
  }
}
