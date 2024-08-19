import 'package:chat_app/view_model/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/message_model.dart';
import '../../../utils/utils.dart';

class SentMessageCard extends StatelessWidget {
  SentMessageCard({super.key, required this.messageModel});
  final MessageModel messageModel;
  final controller = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 30,
        ),
        Flexible(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  border:
                      Border.all(width: 1.4, color: Colors.blueGrey.shade600)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    messageModel.message,
                    style: const TextStyle(fontSize: 15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Utils.getTime(messageModel.sent),
                        style: const TextStyle(fontSize: 11),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      messageModel.read == ''
                          ? const Icon(
                              Icons.done,
                              color: Colors.blueGrey,
                              size: 17,
                            )
                          : const Icon(
                              Icons.done_all,
                              color: Colors.blue,
                              size: 17,
                            )
                    ],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
