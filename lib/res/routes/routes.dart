import 'package:chat_app/bindings/app_bindings.dart';
import 'package:chat_app/res/routes/routes_name.dart';
import 'package:chat_app/view/chat_screen/chat_screen.dart';
import 'package:chat_app/view/email_auth/login_screen.dart';
import 'package:chat_app/view/home_screen/home_screen.dart';
import 'package:chat_app/view/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static routeList() => [
        GetPage(
            name: RouteNames.login_screen,
            page: () => LoginScreen(),
            binding: LoginBinding()),
        GetPage(
            name: RouteNames.home_screen,
            page: () => HomeScreen(
                  me: Get.arguments,
                ),
            binding: HomeBinding()),
        GetPage(
            name: RouteNames.profile_screen,
            page: () => ProfileScreen(userModel: Get.arguments),
            binding: ProfileBinding()),
        GetPage(
            name: RouteNames.chat_screen,
            page: () => ChatScreen(userModel: Get.arguments),
            binding: ChatBinding())
      ];
}
