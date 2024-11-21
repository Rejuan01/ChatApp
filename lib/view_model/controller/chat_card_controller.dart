import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/repository/message_repos.dart';
import 'package:chat_app/view_model/controller/home_controller.dart';
import 'package:get/get.dart';

class ChatCardController extends GetxController {
  ChatCardController({required this.receiver});
  final UserModel me = Get.find<HomeController>().currentUser;
  final UserModel receiver;
  final lastMessage = ''.obs;
  final lastMessageTime = ''.obs;
  final lastMessageSent = false.obs; //last message is sent or received
  final isReceiverActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getLastMessage();
  }

  _getLastMessage() {
    final messageRepos = MessageRepository();
    messageRepos.lastMessage(me.id, receiver.id).listen((event) {
      if (event.docs.isNotEmpty) {
        final messageModel = MessageModel.fromJson(event.docs[0].data());
        lastMessage.value = messageModel.message;
        lastMessageTime.value = messageModel.sent;
      }
    });
  }
}
