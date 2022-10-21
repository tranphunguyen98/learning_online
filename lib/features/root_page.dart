import 'package:flutter/material.dart';
import 'package:learning_online/core/styles.dart';
import 'package:learning_online/features/home/pages/home_page.dart';
import 'package:learning_online/features/teacher_list/pages/teacher_list_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedIndex = 0;
  late Widget currentPage = HomePage();
  late String title = 'Trang chủ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title, style: kFontSemiboldBlack_16),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (selectedIndex == 0) {
            currentPage = HomePage();
          } else if (selectedIndex == 3) {
            currentPage = TeacherListPage();
            title = 'Danh sách tutor';
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Tin nhắn'),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Sắp diễn ra'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Gia sư'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'),
        ],
      ),
      body: currentPage,
    );
  }
}
