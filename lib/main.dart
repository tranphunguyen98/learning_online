import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/features/register/pages/register_page.dart';
import 'package:learning_online/features/root_controller.dart';
import 'package:learning_online/utils/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/login/pages/login_page.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'Lịch sử học': 'Learning histories',
          'Danh sách giáo viên ưa thích': 'Favorite tutors',
          'Ngôn ngữ': 'Language',
          'Tiếng Anh': 'English',
          'Tiếng Việt': 'Vietnamese',
          'Đăng xuất': 'Log out',
          'Sáng': 'Light',
          'Tối': 'Dark',
          'Chủ đề': 'Theme',
          'Trang chủ': 'Home',
          'Khóa học': 'Course',
          'Lịch học': 'Schedule',
          'Gia sư': 'Tutor',
          'Cài đặt': 'Setting',
          'Buổi học sắp diễn ra': 'Upcoming lesson',
          'Còn': 'Still',
          'Vào lớp học': 'Enter lesson',
          'Tổng số giờ bạn đã học là': 'Learning total',
          'Gia sư được đề xuất': 'Recommend tutors',
          'Bạn không có buổi học nào.': 'Empty lesson',
          'Chưa có đánh giá': 'Empty feedback',
          'giờ': 'hours',
          'phút': 'minutes',
          'Hồ sơ': 'Profile',
          'Tên': 'Name',
          'Họ và Tên': 'Full Name',
          'Vui lòng nhập tên': 'Please enter name',
          'Địa chỉ email': 'Email address',
          'Vui lòng nhập đúng định dạng email.': 'Please enter valid email address',
          'Quốc gia': 'Country',
          'Chọn quốc gia': 'Select country',
          'Số điện thoại': 'Phone number',
          'Trình độ': 'Level',
          'Chọn trình độ': 'Select level',
          'Bắt buộc chọn môn muốn học': 'subject is required',
          'Lưu': 'Save',
          'Lưu thành công': 'Save successful',
          'Ngày sinh': 'Date of birth',
          'Muốn học': 'Want to learn',
          'Gia Sư Việt Nam': 'Vietnamese Tutor',
          'Gia Sư Nước Ngoài': 'Foreigner Tutor',
          'Gia Sư Tiếng Anh Bản Ngữ': 'Native Tutor',
          'Tiếng anh cho trẻ em': 'English for kids',
          'Tiếng anh cho công việc': 'Business english',
          'Giao tiếp': 'Conversation',
          'Tất cả': 'All',
          'Yêu thích': 'Favorite',
          'Nhắn tin': 'Message',
          'Báo cáo':'Report',
          'Chuyên ngành': 'Field',
          'Sở thích': 'Hobby',
          'Kinh nghiêm': 'Experience',
          'Đánh giá và bình luận': 'Rating and comment',
          'Đã đặt': 'Booked',
          'Đã được đặt': 'have booked',
          'Đặt lịch': 'Book',
          'Tìm kiếm khóa hoc': 'Search course',
          'Lịch đã đặt' : 'Booked schedule',
          '1 buổi học': '1 lesson',
          'buồi học liên tục': 'lessons',
          'Thời gian học': 'Time',
          'Vào buổi học': 'Enter lesson',
          'Tháng': ',',
          'Buổi': 'Lesson',
          'Hủy buổi học': 'Cancel lesson',
          'Yêu cầu cho buổi học': 'Request for lesson',
          'Hiện tại không có yêu cầu cho lớp học này. Xin vui lòng viết ra bất kỳ yêu cầu nào cho giáo viên nếu có.': 'There are not have request for lesson',
          'Đăng nhập': 'Login',
          'Bạn đã có tài khoản?':'Do you have account?',
          'Đăng ký': 'Sign up',
          'Hoặc đăng ký với': 'Or sign up with',
          'Địa chỉ E-mail' : 'Email address',
          'Mật khẩu': 'Password',
          'Xác nhận Mật khẩu': 'Confirmed password',
          'Quên mật khẩu': 'Forgot password',
          'Chưa có tài khoản?': 'Have not you have account?',
          'Hoặc đăng nhập với': 'Or sign in with',
          'Tìm Tutor': 'Search tutor',
          'Lịch sử các buổi học': 'History of lesson',
          'Lịch sử học rỗng': 'Empty history',
          'năm trước' : 'year ago',
          'tháng trước': 'month ago',
          'phút trước': 'minutes ago',
          ' giờ trước': ' hours ago',
          'giờ trước': 'hour ago',
          'Đánh giá từ gia sư': 'Rating from tutor',
          'Không có yêu cầu cho buổi học': 'There are not request for lesson',
        },
      };
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  // This widget is the root of your application.
  final RootController rootController = Get.put(RootController());

  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  final instance = await SharedPreferences.getInstance();
  if (instance.getBool('isEnglish') ?? false) {
    Get.updateLocale(Locale('en'));
    rootController.isVietnamese = false;
  }
  runApp(
    GetMaterialApp(
      translations: Messages(),
      supportedLocales: [Locale('en'), Locale('vn')],
      fallbackLocale: Locale('vi'),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
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
