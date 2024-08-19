import 'package:chat_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../model/user_model.dart';

class SignUpServices {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<UserModel?> createUser(
      String name, String email, String password) async {
    if (await _isUserAvailable(name)) {
      try {
        UserCredential credential = await _firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);
        User? user = credential.user;
        if (user != null) {
          await user.updateProfile(displayName: name);

          await user.reload();
          user = _firebaseAuth.currentUser;
          UserModel? userModel = await _saveUser(user!);
          if (kDebugMode) {
            print("New User added");
          }
          return userModel;
        } else {
          return null;
        }
      } on FirebaseAuthException catch (ex) {
        if (kDebugMode) {
          print(ex.code.toString());
        }
        return null;
      }
    } else {
      Utils.toastMessage('This username is not available');
      return null;
    }
  }

  Future<UserModel?> _saveUser(User user) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final model = UserModel(
        id: user.uid,
        name: user.displayName.toString(),
        email: user.email.toString(),
        image: user.photoURL ?? '',
        about: "New in ChatApp",
        isOnline: false,
        createdAt: time,
        lastActive: time,
        pushToken: '');
    try {
      await _firestore.collection('Users').doc(user.uid).set(model.toJson());
      return model;
    } catch (e) {
      print(e.toString());
      Utils.toastMessage(e.toString());
      return null;
    }
  }

  Future<bool> _isUserAvailable(String name) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('Users')
        .where('name', isEqualTo: name)
        .get();
    if (kDebugMode) {
      print('Length is ----- ${querySnapshot.docs.length}');
    }
    return querySnapshot.docs.isEmpty;
  }
}
