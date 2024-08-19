import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view_model/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repository/message_repos.dart';

class ChatController extends GetxController {
  ChatController({required this.receiver});

  final UserModel receiver;
  final UserModel currentUser = Get.find<HomeController>().currentUser;
  final textController = TextEditingController().obs;
  RxList<MessageModel> messages = <MessageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _setMessageList();
  }

  _setMessageList() {
    final messageRepos = MessageRepository();
    messageRepos.getMessages(receiver.id, currentUser.id).listen((event) {
      messages.value =
          event.docs.map((e) => MessageModel.fromJson(e.data())).toList();
    });
  }

  sentMessage() {
    final messageRepos = MessageRepository();
    String text = textController.value.text;
    if (text != '') {
      messageRepos.sentMessages(receiver.id, currentUser.id, text);
      textController.value.clear();
    }
  }

  markRead(MessageModel message) async {
    final messageRepos = MessageRepository();
    await messageRepos.updateReadStatus(message);
  }
}
