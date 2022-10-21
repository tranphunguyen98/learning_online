import 'package:flutter/material.dart';
import 'package:learning_online/features/forgot_password/pages/forgot_password_page.dart';
import 'package:learning_online/features/login/pages/login_page.dart';
import 'package:learning_online/features/register/pages/register_page.dart';

import '../features/home/pages/home_page.dart';
import '../features/setting/pages/setting_page.dart';
import '../features/teacher_list/pages/teacher_list_page.dart';

class AppRouter {
  static const String kHome = '/home';
  static const String kSplash = '/splash';
  static const String kLoading = '/loading';
  static const String kLogin = '/login';
  static const String kRegister = '/register';
  static const String kChangePassword = '/changePassword';
  static const String kForgotPassword = '/forgotPassword';
  static const String kSetting = '/setting';
  static const String kTeacherList = '/teacherList';
  static const String kArgumentTask = '/argumentTask';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    // case kSplash:
    //   return MaterialPageRoute(builder: (_) => SplashScreen());
    // case kLoading:
    //   return MaterialPageRoute(builder: (_) => LoadingScreen());
    case kHome:
      return MaterialPageRoute(builder: (_) =>HomePage());
      case kLogin:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case kRegister:
        return MaterialPageRoute(builder: (_) => RegisterPage());
    case kForgotPassword:
      return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
    // case kChangePassword:
    //   return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
    case kSetting:
      return MaterialPageRoute(builder: (_) => SettingPage());
      case kTeacherList:
        return MaterialPageRoute(builder: (_) => TeacherListPage());
    }
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
