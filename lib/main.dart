import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/features/register/pages/register_page.dart';
import 'package:learning_online/features/root_controller.dart';
import 'package:learning_online/utils/router.dart';

import 'features/login/pages/login_page.dart';
import 'features/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final RootController rootController = Get.put(RootController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LetTutor',
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
