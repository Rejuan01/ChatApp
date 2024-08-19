import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/chat_screen/widgets/chat_input.dart';
import 'package:chat_app/view/chat_screen/widgets/custom_appbar.dart';
import 'package:chat_app/view/chat_screen/widgets/received_message_card.dart';
import 'package:chat_app/view/chat_screen/widgets/sent_message_card.dart';
import 'package:chat_app/view_model/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.userModel});
  final UserModel userModel;
  final controller = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottomOpacity: 1,
          flexibleSpace: customAppBar(userModel),
        ),
        body: Column(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    if (controller.messages[index].fromId ==
                        controller.receiver.id) {
                      return ReceivedMessageCard(
                        messageModel: controller.messages[index],
                      );
                    } else {
                      return SentMessageCard(
                        messageModel: controller.messages[index],
                      );
                    }
                  },
                  itemCount: controller.messages.length,
                ),
              ),
            ),
            chatInput()
          ],
        ));
  }
}
