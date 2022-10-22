import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/features/home/widgets/widget_home_teacher_item.dart';
import 'package:learning_online/features/teacher_list/logic.dart';
import 'package:learning_online/utils/router.dart';

class FavoriteTeacherPage extends StatelessWidget {
  TeacherListController controller = Get.find<TeacherListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetCoreAppBar(title: 'Danh sách giáo viên ưa thích', context: context),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(child: _buildListOfTeacher()),
        ],
      ),
    );
  }

  Widget _buildListOfTeacher() {
    return GetBuilder<TeacherListController>(
        init: controller,
        builder: (logic) {
          if (logic.displayedTeachers.isEmpty) {
            return Center(
              child: Text(
                'Không có giáo viên nào',
                style: kFontSemiboldBlack_16,
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: logic.favoriteTeachers.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouter.kTeacherDetail,
                            arguments: logic.displayedTeachers[index]);
                      },
                      child: WidgetHomeTeacherItem(
                        key: UniqueKey(),
                        teacherModel: logic.favoriteTeachers[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
