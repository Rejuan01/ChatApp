import 'dart:convert';

import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginServices {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUser(String name, password) async {
    UserModel? userModel = await _findUser(name);
    if (userModel != null) {
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: userModel.email, password: password);
      } on FirebaseAuthException catch (ex) {
        Utils.toastMessage(ex.code.toString());
      }
    } else {
      Utils.toastMessage('Login Failed');
    }
    return userModel;
  }

  Future<UserModel?> _findUser(String name) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('Users')
        .where('name', isEqualTo: name)
        .get();
    if (querySnapshot.docs.length == 1) {
      //var data = jsonDecode(querySnapshot.docs[0].data().toString());
      UserModel model = UserModel.fromJson(
          querySnapshot.docs[0].data() as Map<String, dynamic>);

      return model;
    } else if (querySnapshot.docs.isEmpty) {
      print('Length ---- ${querySnapshot.docs.length}');
      Utils.toastMessage('User not found');
    }
    return null;
  }
}
