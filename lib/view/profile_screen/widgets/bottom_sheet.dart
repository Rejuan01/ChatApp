import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../view_model/controller/profile_controller.dart';

void customBottomSheet(BuildContext context) {
  double height = Get.height;
  final ProfileController controller = Get.find<ProfileController>();
  double width = Get.width;
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(height * 0.03),
            topRight: Radius.circular(height * 0.03))),
    builder: (_) {
      return ListView(
        padding: EdgeInsets.only(top: height * 0.03, bottom: height * 0.05),
        shrinkWrap: true,
        children: [
          const Center(
            child: Text(
              'Pick profile picture',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.28, height * 0.15),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white70),
                  onPressed: () {
                    controller.getImage(ImageSource.gallery);
                  },
                  child: Image.asset(
                    'assets/images/add_image.png',
                    fit: BoxFit.cover,
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.28, height * 0.15),
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white70),
                  onPressed: () {
                    controller.getImage(ImageSource.camera);
                  },
                  child: Image.asset(
                    'assets/images/camera.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        ],
      );
    },
  );
}
