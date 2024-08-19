import 'package:chat_app/view_model/controller/chat_controller.dart';
import 'package:chat_app/view_model/controller/home_controller.dart';
import 'package:chat_app/view_model/controller/login_controller.dart';
import 'package:chat_app/view_model/controller/profile_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(receiver: Get.arguments),
    );
  }
}
