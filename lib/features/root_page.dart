import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/features/course_list/course_list_page.dart';
import 'package:learning_online/features/home/pages/home_page.dart';
import 'package:learning_online/features/schedule/schedule_page.dart';
import 'package:learning_online/features/setting/pages/setting_page.dart';
import 'package:learning_online/features/teacher_list/logic.dart';
import 'package:learning_online/features/teacher_list/pages/teacher_list_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  late Widget currentPage = HomePage();
  late String title = 'Trang chủ'.tr;

  final controller = Get.put(TeacherListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Text(title, style: kFontSemiboldBlack_16),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (selectedIndex == 0) {
            currentPage = HomePage();
          } else if (selectedIndex == 1) {
            currentPage = CourseListPage();
          } else if (selectedIndex == 2) {
            currentPage = const SchedulePage();
          } else if (selectedIndex == 3) {
            currentPage = TeacherListPage();
            title = 'Gia sư'.tr;
          } else if (selectedIndex == 4) {
            currentPage = const SettingPage();
            title = 'Cài đặt'.tr;
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Khóa học'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Lịch học'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Gia sư'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'.tr),
        ],
      ),
      body: SafeArea(child: currentPage),
    );
  }
}
