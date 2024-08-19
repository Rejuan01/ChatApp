import 'dart:io';

import 'package:chat_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../utils/utils.dart';

class UpdateServices {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  updateProfileData(UserModel userModel, String name, about) async {
    try {
      await _firestore
          .collection('Users')
          .doc(userModel.id)
          .update({'name': name, 'about': about}).then((value) {
        userModel.name = name;
        userModel.about = about;
        Utils.toastMessage('Updated');
      });
    } catch (ex) {
      Utils.toastMessage(ex.toString());
    }
  }

  updateProfilePicture(String path, UserModel userModel) async {
    final File file = File(path);
    final ext = path.split('.').last;
    try {
      TaskSnapshot snapshot = await _storage
          .ref('profile_pictures')
          .child('${userModel.id}.$ext')
          .putFile(file);
      String url = await snapshot.ref.getDownloadURL();
      await _firestore
          .collection('Users')
          .doc(userModel.id)
          .update({'image': url}).then((value) {
        userModel.image = url;
        Utils.toastMessage('Picture Uploaded');
      });
    } catch (ex) {
      Utils.toastMessage(ex.toString());
    }
  }
}
