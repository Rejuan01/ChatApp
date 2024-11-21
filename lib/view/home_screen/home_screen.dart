import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/res/routes/routes_name.dart';
import 'package:chat_app/view/home_screen/widgets/chat_card.dart';
import 'package:chat_app/view/profile_screen/profile_screen.dart';
import 'package:chat_app/view_model/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.me}) {
    //HomeController is set inside HomeScreen constructor
    controller.setInitialValue(me);
  }
  final UserModel me;
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: PopScope(
          canPop: !controller.isSearching.value,
          onPopInvoked: (didPop) async {
            if (!didPop) {
              controller.searchStateChange();
            }
          },
          child: Scaffold(
              appBar: AppBar(
                title: Obx(
                  () => controller.isSearching.value
                      ? TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blueGrey.shade50,
                            hintText: 'Search..',
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(26)),
                          ),
                          style:
                              const TextStyle(fontSize: 16, letterSpacing: 1),
                          onChanged: (value) {
                            controller.searchList.clear();
                            if (value.isEmpty) {
                              controller.isSearching.value = true;
                              controller.searchList.value = [];
                            }
                            print('Inside 1st stage.......... $value');
                            for (var i in controller.userList) {
                              print('Inside second stage..................');
                              if (i.name
                                      .toLowerCase()
                                      .contains(value.toLowerCase()) ||
                                  i.email
                                      .toLowerCase()
                                      .contains(value.toLowerCase())) {
                                controller.searchList.add(i);
                              }
                            }
                          },
                        )
                      : const Text('Chat App'),
                ),
                centerTitle: true,
                leading: const Icon(Icons.home_filled),
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.searchStateChange();
                      },
                      icon: Obx(() => Icon(controller.isSearching.value
                          ? Icons.cancel
                          : Icons.search))),
                  IconButton(
                      onPressed: () {
                        Get.toNamed(RouteNames.profile_screen, arguments: me);
                      },
                      icon: const Icon(Icons.more_vert))
                ],
              ),
              body: Obx(() => ListView.builder(
                    itemCount: controller.isSearching.value
                        ? controller.searchList.length
                        : controller.userList.length,
                    itemBuilder: (context, index) {
                      return ChatCard(
                          userModel: controller.isSearching.value
                              ? controller.searchList[index]
                              : controller.userList[index]);
                    },
                  ))),
        ));
  }
}
