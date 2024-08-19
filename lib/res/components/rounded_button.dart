import 'package:chat_app/res/colors/app_color.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final double height, width;
  final Color buttonColor, textColor;
  final VoidCallback callback;
  final bool isLoading;
  const RoundButton(
      {super.key,
      required this.text,
      this.height = 50,
      this.width = double.infinity,
      this.buttonColor = AppColor.buttonColor,
      this.textColor = Colors.white,
      this.isLoading = false,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: buttonColor),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: AppColor.primaryButtonColor,
                  backgroundColor: AppColor.whiteColor,
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: height / 3),
                ),
        ),
      ),
    );
  }
}
