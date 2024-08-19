import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/services/profile_update_servieces.dart';

class UpdateRepository {
  final _updateService = UpdateServices();

  updateProfileInfo(UserModel userModel, String name, about) async {
    await _updateService.updateProfileData(userModel, name, about);
  }

  updateProfilePic(String path, UserModel userModel) async {
    await _updateService.updateProfilePicture(path, userModel);
  }
}
