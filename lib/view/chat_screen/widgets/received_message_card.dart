import 'package:chat_app/model/message_model.dart';
import 'package:chat_app/utils/utils.dart';
import 'package:chat_app/view_model/controller/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReceivedMessageCard extends StatelessWidget {
  ReceivedMessageCard({super.key, required this.messageModel}) {
    if (messageModel.read == '') {
      Get.find<ChatController>().markRead(messageModel);
      print('Read status update..............');
    }
  }
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              margin: EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  border:
                      Border.all(width: 1.4, color: Colors.blueGrey.shade600)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    messageModel.message,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    Utils.getTime(messageModel.sent),
                    style: TextStyle(fontSize: 11),
                  )
                ],
              )),
        ),
        SizedBox(
          width: 60,
        )
      ],
    );
  }
}
