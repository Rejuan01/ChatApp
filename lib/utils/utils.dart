import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../res/colors/app_color.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.redColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static toastMessageCenter(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.redColor,
      gravity: ToastGravity.CENTER,
      toastLength: Toast.LENGTH_LONG,
      textColor: AppColor.whiteColor,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message, backgroundColor: AppColor.snackColor);
  }

  static getTime(String time) {
    // for every chat
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    return DateFormat.jm().format(dateTime).toString(); // 12:30 AM
  }

  static lstMessageTime(String time) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(time));
    DateTime now = DateTime.now();

    if (now.day == dateTime.day &&
        now.month == dateTime.month &&
        now.year == dateTime.year) {
      return DateFormat.jm().format(dateTime).toString(); // 12:30 AM
    } else if (now.subtract(const Duration(days: 1)).day == dateTime.day &&
        now.month == dateTime.month &&
        now.year == dateTime.year) {
      return 'Yesterday';
    } else {
      return DateFormat.yMd().format(dateTime).toString(); // MM/DD/YYYY
    }
  }
}
