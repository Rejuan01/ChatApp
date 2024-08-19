import 'package:chat_app/res/components/rounded_button.dart';
import 'package:chat_app/view/phone_auth/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({super.key});
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: phoneNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            SizedBox(
              height: 10,
            ),
            RoundButton(
              text: 'Submit',
              callback: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                  verificationCompleted: (phoneAuthCredential) {},
                  verificationFailed: (error) {},
                  codeSent: (verificationId, forceResendingToken) {
                    Get.to(OtpScreen(verificationID: verificationId));
                  },
                  codeAutoRetrievalTimeout: (verificationId) {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
