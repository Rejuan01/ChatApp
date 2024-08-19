import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';

class HomeController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  RxList<UserModel> searchList = <UserModel>[].obs;
  late final UserModel currentUser;
  final isSearching = false.obs;

  setInitialValue(UserModel userModel) {
    currentUser = userModel;
    _fetchUsers();
  }

  searchStateChange() {
    isSearching.value = !isSearching.value;
    searchList.clear(); //to not showing previous searchList by taping search
  }

  _fetchUsers() {
    FirebaseFirestore.instance
        .collection('Users')
        .where('id', isNotEqualTo: currentUser.id)
        .snapshots()
        .listen((snapshot) {
      userList.value =
          snapshot.docs.map((e) => UserModel.fromJson(e.data())).toList();
    });
  }
}
