import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_radio_row_group.dart';
import 'package:learning_online/core/widgets/widget_search_text_field.dart';
import 'package:learning_online/features/teacher_list/widgets/widget_teacher_item.dart';
import 'package:learning_online/model/teacher.dart';

import '../logic.dart';

class TeacherListPage extends StatelessWidget {
  final List<String> categoryList = [
    'All',
    'English for Kids',
    'English for Adults',
    'English for Adults1',
    'English for Adults2',
    'English for Adults3',
    'English for Adults4',
  ];

  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Danh sách Tutor', style: kFontSemiboldBlack_16),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: WidgetSearchTextField(hint: 'Tìm Tutor'),
            ),
            SizedBox(height: 16),
            Container(
              height: 36,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: WidgetRadioRowGroup(data: categoryList),
            ),
            _buildListOfTeacher(),
          ],
        ),
      ),
    );
  }

  Widget _buildListOfTeacher() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => WidgetTeacherItem(
              teacherModel:
                  index % 2 == 0 ? TeacherModel.mock : TeacherModel.mock1,
            ),
            separatorBuilder: (context, index) => SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}
