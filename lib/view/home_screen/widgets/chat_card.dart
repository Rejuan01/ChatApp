import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/res/routes/routes_name.dart';
import 'package:chat_app/view/chat_screen/chat_screen.dart';
import 'package:chat_app/view_model/controller/chat_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatCard extends StatelessWidget {
  ChatCard({super.key, required this.userModel}) {
    controller =
        Get.put(ChatCardController(receiver: userModel), tag: userModel.id);
  }
  late final ChatCardController controller;
  final UserModel userModel;
  final double height = Get.height;
  final double width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      //margin: EdgeInsets.symmetric(),
      child: InkWell(
        onTap: () {
          Get.toNamed(RouteNames.chat_screen, arguments: userModel);
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(height * 0.025),
            child: userModel.image == ""
                ? CircleAvatar(
                    child: Text(
                      userModel.name[0],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                : CachedNetworkImage(
                    imageUrl: userModel.image,
                    height: height * 0.05,
                    width: height * 0.05,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const CircleAvatar(
                      child: Icon(Icons.error),
                    ),
                  ),
          ),
          title: Text(
            userModel.name,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Obx(() => Text(
                controller.lastMessage.value != ''
                    ? controller.lastMessage.value
                    : userModel.about,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14),
              )),
          trailing: !userModel.isOnline
              ? Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(4)),
                )
              : Container(
                  height: 4,
                  width: 4,
                ),
        ),
      ),
    );
  }
}
