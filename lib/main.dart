import 'package:flutter/material.dart';
import 'package:learning_online/features/forgot_password/pages/forgot_password_page.dart';
import 'package:learning_online/features/home/pages/home_page.dart';
import 'package:learning_online/features/login/pages/login_page.dart';
import 'package:learning_online/features/message/message_page.dart';
import 'package:learning_online/features/profile/pages/profile_page.dart';
import 'package:learning_online/features/schedule/schedule_page.dart';
import 'package:learning_online/features/setting/pages/setting_page.dart';
import 'package:learning_online/features/teacher_detail/pages/teacher_detail_page.dart';
import 'package:learning_online/features/teacher_list/pages/teacher_list_page.dart';
import 'package:learning_online/utils/router.dart';

import 'features/register/pages/register_page.dart';
import 'features/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: RootPage(),
    );
  }
}
