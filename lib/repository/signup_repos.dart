import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/services/signup_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepository {
  // final String name;
  // String? email;
  // final String password;
  final _authService = SignUpServices();

  SignUpRepository();

  Future<UserModel?> signUp(String email, name, password) async {
    return await _authService.createUser(name, email, password);
  }
}
