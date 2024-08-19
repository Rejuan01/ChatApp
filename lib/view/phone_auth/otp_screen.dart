import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../res/components/rounded_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.verificationID});
  final String verificationID;
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm OTP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: 'OTP',
                  prefixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
            const SizedBox(
              height: 20,
            ),
            RoundButton(
              text: 'Submit',
              callback: () async {
                try {
                  final credential = await PhoneAuthProvider.credential(
                      verificationId: verificationID,
                      smsCode: otpController.text);
                  FirebaseAuth.instance.signInWithCredential(credential);
                } catch (ex) {
                  print(ex.toString());
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
