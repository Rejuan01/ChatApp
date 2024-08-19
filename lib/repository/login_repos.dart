import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/services/login_servieces.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository {
  final _loginService = LoginServices();
  Future<UserModel?> logIn(String name, password) async {
    return await _loginService.getUser(name, password);
  }
}
