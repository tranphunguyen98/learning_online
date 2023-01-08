import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/home/home_logic.dart';
import 'package:learning_online/features/home/widgets/widget_header_home.dart';
import 'package:learning_online/features/home/widgets/widget_home_teacher_item.dart';
import 'package:learning_online/features/teacher_list/logic.dart';
import 'package:learning_online/model/teacher.dart';
import 'package:learning_online/utils/router.dart';
import 'package:loadmore/loadmore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeLogic = Get.put(HomeLogic());
  TeacherListController controller = Get.find<TeacherListController>();
  @override
  void initState() {
    controller.search();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WidgetHeaderHome(),
        Expanded(child: _buildListOfTeacher()),
      ],
    );
  }

  Widget _buildListOfTeacher() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gia sư được đề xuất',
                    style: kFontRegularDefault_14,
                  ),
                  const SizedBox(height: 2),
                  const SizedBox(
                    width: 136,
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      color: kBlackColor,
                    ),
                  ),
                ],
              ),
              // const SizedBox(width: 2),
              // const Icon(
              //   Icons.chevron_right,
              //   color: kPrimaryColor,
              // ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GetBuilder<TeacherListController>(
              init: controller,
              builder: (logic) {
                return LoadMore(
                  isFinish: logic.isFishLoadMore,
                  textBuilder: (status) => '',
                  onLoadMore: () {
                    return logic.search(true);
                  },
                  child: ListView.separated(
                    itemCount: logic.displayedTeachers.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRouter.kTeacherDetail,
                          arguments: logic.displayedTeachers[index].userId,
                        );
                      },
                      child: WidgetHomeTeacherItem(
                        key: UniqueKey(),
                        teacherModel: logic.displayedTeachers[index],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
