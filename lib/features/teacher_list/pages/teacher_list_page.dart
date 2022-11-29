import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_radio_row_group.dart';
import 'package:learning_online/core/widgets/widget_search_text_field.dart';
import 'package:learning_online/utils/router.dart';

import '../../home/widgets/widget_home_teacher_item.dart';
import '../logic.dart';

class TeacherListPage extends StatefulWidget {
  @override
  _TeacherListPageState createState() => _TeacherListPageState();
}

class _TeacherListPageState extends State<TeacherListPage> {
  final List<String> categoryList = [
    ...fieldMap.keys
  ];

  TeacherListController controller = Get.find<TeacherListController>();

  @override
  void initState() {
    controller.search('', '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherListController>(builder: (logic) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                WidgetSearchTextField(
                  hint: 'Tìm Tutor',
                  onChanged: (value) {
                    controller.changeKeyword(value);
                  },
                ),
                Positioned.fill(
                  top: 0,
                  right: 8,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: PopupMenuButton<ETeacherFilter>(
                      icon: Icon(
                        Icons.filter_alt,
                        color: kGrayColor,
                      ),
                      onSelected: (value) {
                        controller.changeFilter(value);
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            value: ETeacherFilter.Default,
                            child: Text('Sắp xếp theo thứ tự mặc định'),
                          ),
                          PopupMenuItem(
                            value: ETeacherFilter.Favorite,
                            child: Text('Sắp xếp theo ưa thích'),
                          ),
                          PopupMenuItem(
                            value: ETeacherFilter.Rating,
                            child: Text('Sắp xếp theo theo sao giảm dần'),
                          ),
                        ];
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 36,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: WidgetRadioRowGroup(
              displayText: (key) => fieldMap[key] ?? '',
              data: categoryList,
              onValueChanged: (value) {
                controller.changeSpecialize(value != 'All' ? value : '');
              },
            ),
          ),
          Expanded(child: _buildListOfTeacher()),
        ],
      );
    });
  }

  Widget _buildListOfTeacher() {
    return GetBuilder<TeacherListController>(
        init: controller,
        builder: (logic) {
          if (logic.displayedTeachers.isEmpty) {
            return Stack(
              children: [
                Center(
                  child: Text(
                    'Không có giáo viên nào',
                    style: kFontSemiboldBlack_16,
                  ),
                ),
                if (logic.isLoading)
                  Container(
                    color: kBlackColor.withOpacity(0.2),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    ),
                  )
              ],
            );
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: logic.displayedTeachers.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRouter.kTeacherDetail,
                                arguments: logic.displayedTeachers[index]);
                          },
                          child: WidgetHomeTeacherItem(
                            key: UniqueKey(),
                            teacherModel: logic.displayedTeachers[index],
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(height: 16),
                      ),
                    ],
                  ),
                ),
              ),
              if (logic.isLoading)
                Container(
                  color: kBlackColor.withOpacity(0.2),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  ),
                )
            ],
          );
        });
  }
}
