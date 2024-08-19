import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/res/routes/routes.dart';
import 'package:chat_app/res/routes/routes_name.dart';
import 'package:chat_app/view/email_auth/login_screen.dart';
import 'package:chat_app/view/phone_auth/phone_auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        getPages: AppRoutes.routeList(),
        initialRoute: RouteNames.login_screen);
  }
}
