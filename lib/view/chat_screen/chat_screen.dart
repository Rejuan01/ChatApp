import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/view/chat_screen/widgets/chat_input.dart';
import 'package:chat_app/view/chat_screen/widgets/custom_appbar.dart';
import 'package:chat_app/view/chat_screen/widgets/received_message_card.dart';
import 'package:chat_app/view/chat_screen/widgets/sent_message_card.dart';
import 'package:chat_app/view_model/controller/chat_controller.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key, required this.userModel});
  final UserModel userModel;
  final controller = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.showEmoji.value) {
          controller.emojiStateChange();
          return false; // if showing emoji, don't pop
        }
        return true; // else pop the screen
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          controller.showEmoji.value = false;
          print(controller.showEmoji.value);
        },
        child: Scaffold(
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
                chatInput(),
                Obx(() => controller.showEmoji.value == true
                    ? SizedBox(
                        height: Get.height * 0.35,
                        child: EmojiPicker(
                          textEditingController:
                              controller.textController.value,
                          config: Config(columns: 7, emojiSizeMax: 32),
                        ),
                      )
                    : Container())
              ],
            )),
      ),
    );
  }
}
