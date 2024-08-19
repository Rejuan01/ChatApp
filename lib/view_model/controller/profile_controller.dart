import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/res/routes/routes_name.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../repository/update_repos.dart';

class ProfileController extends GetxController {
  late final UserModel userModel;
  final usernameController = TextEditingController().obs;
  final statusController = TextEditingController().obs;
  final pickedImageUrl = ''.obs;
  final isUpdating = false.obs;

  setInitialValue(UserModel user) {
    userModel = user;
    usernameController.value.text = user.name;
    statusController.value.text = user.about;
  }

  updateUserInfo() async {
    var name = usernameController.value.text;
    var about = statusController.value.text;
    final updateRepos = UpdateRepository();
    if (name != userModel.name || about != userModel.about) {
      isUpdating.value = true;
      await updateRepos.updateProfileInfo(userModel, name, about);
      isUpdating.value = false;
    }
  }

  updateProfilePicture() async {
    final updateRepos = UpdateRepository();
    if (pickedImageUrl.value != '') {
      isUpdating.value = true;
      await updateRepos.updateProfilePic(pickedImageUrl.value, userModel);
      //ensures no more uploading the same pic and load the pic fom url
      pickedImageUrl.value = '';
      isUpdating.value = false;
    }
  }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Get.offAllNamed(RouteNames.login_screen);
      });
    } on FirebaseAuthException catch (ex) {
      Utils.toastMessage(ex.toString());
    }
  }

  getImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        pickedImageUrl.value = image.path;
      }
    } catch (ex) {
      Utils.toastMessage(ex.toString());
    }
    Get.back();
  }
}
