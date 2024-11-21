import 'package:chat_app/view_model/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget chatInput() {
  final controller = Get.find<ChatController>();
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    child: Row(children: [
      Expanded(
        child: Card(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    if (controller.focusNode.value.hasFocus) {
                      controller.focusNode.value.unfocus(); //close keyboard
                      Future.delayed(const Duration(milliseconds: 300), () {
                        controller
                            .emojiStateChange(); // Open or close emoji panel
                      });
                    } else {
                      controller.emojiStateChange();
                    }
                    print(controller.showEmoji.value);
                  },
                  icon: Icon(
                    Icons.emoji_emotions,
                    size: 26,
                  )),
              Expanded(
                  child: Obx(() => TextField(
                        controller: controller.textController.value,
                        focusNode: controller.focusNode.value,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Say something...',
                            hintStyle: TextStyle()),
                        onTap: () {
                          controller.showEmoji.value =
                              false; // Don't show emoji if textEditingController is in focus
                        },
                      ))),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.image,
                    size: 26,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.camera_alt,
                    size: 26,
                  ))
            ],
          ),
        ),
      ),
      MaterialButton(
        minWidth: 0,
        padding: EdgeInsets.only(top: 7, bottom: 7, left: 6, right: 5),
        color: Colors.blue.shade50,
        onPressed: () {
          controller.sentMessage();
        },
        shape: CircleBorder(),
        child: Icon(
          Icons.send,
          size: 30,
        ),
      )
    ]),
  );
}
