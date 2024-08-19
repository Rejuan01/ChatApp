import 'package:chat_app/repository/login_repos.dart';
import 'package:chat_app/repository/signup_repos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final toLogin = true.obs;
  final isLoading = false.obs;
  void changeLoginState() {
    toLogin.value = !toLogin.value;
    emailController.value.clear();
    nameController.value.clear();
    passwordController.value.clear();
  }

  signup() async {
    isLoading.value = true;
    print('Trying to sign upppppppppppppppppppppppp');
    final signUpRepos = SignUpRepository();
    await signUpRepos
        .signUp(emailController.value.text, nameController.value.text,
            passwordController.value.text)
        .then((value) {
      if (value != null) {
        Utils.snackBar('Signed up', 'New account created');
        Get.offNamed(RouteNames.home_screen, arguments: value);
      }
    });
    isLoading.value = false;
  }

  login() async {
    isLoading.value = true;
    final loginRepos = LoginRepository();
    await loginRepos
        .logIn(nameController.value.text, passwordController.value.text)
        .then((value) {
      if (kDebugMode) {
        print('Trying to log innnnnnnnnnnnnnnnnnnn');
        print(value.toString());
      }
      if (value != null) {
        Utils.snackBar('Login', 'Your are logged in successfully');
        Get.offNamed(RouteNames.home_screen, arguments: value);
      }
    });
    isLoading.value = false;
  }
}
