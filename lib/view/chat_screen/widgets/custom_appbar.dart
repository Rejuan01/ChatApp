import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget customAppBar(UserModel userModel) {
  double height = Get.height;
  return SafeArea(
    child: InkWell(
      onTap: () {},
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            width: height * 0.00,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(height * 0.025),
            child: userModel.image == ""
                ? SizedBox(
                    height: height * 0.05,
                    width: height * 0.05,
                    child: CircleAvatar(
                      child: Text(
                        userModel.name[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.025),
                      ),
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
          SizedBox(
            width: height * 0.01,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                userModel.name,
                style: TextStyle(
                    fontSize: height * 0.021, fontWeight: FontWeight.w600),
              ),
              Text(
                'Last active unavailable',
                style: TextStyle(fontSize: height * 0.013),
              )
            ],
          )
        ],
      ),
    ),
  );
}
