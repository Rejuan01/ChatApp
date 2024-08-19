import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/view/profile_screen/widgets/about_field.dart';
import 'package:chat_app/view/profile_screen/widgets/bottom_sheet.dart';
import 'package:chat_app/view/profile_screen/widgets/profile_pic.dart';
import 'package:chat_app/view/profile_screen/widgets/update_button.dart';
import 'package:chat_app/view/profile_screen/widgets/username_field.dart';
import 'package:chat_app/view_model/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.userModel}) {
    //ProfileController is set inside ProfileScreen constructor
    controller.setInitialValue(userModel);
  }
  final UserModel userModel;
  final ProfileController controller = Get.find<ProfileController>();
  final double height = Get.height;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        //ScrollView used to overcome pixel overflow problem during editing in text fields
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  ProfilePicture(userModel: userModel),
                  Positioned(
                      right: height * 0.00,
                      bottom: height * 0.00,
                      child: MaterialButton(
                        elevation: 0.5,
                        color: Colors.white54,
                        shape: const CircleBorder(),
                        child: const Center(
                            child: Icon(
                          Icons.edit,
                          size: 20,
                        )),
                        onPressed: () {
                          customBottomSheet(context);
                        },
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                userModel.email,
                style: const TextStyle(color: Colors.black45, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    UsernameFormField(),
                    const SizedBox(
                      height: 15,
                    ),
                    AboutFormField()
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              UpdateButton(formKey: _formKey)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await controller.logout();
          },
          icon: const Icon(Icons.logout),
          label: const Text('Logout')),
    );
  }
}
