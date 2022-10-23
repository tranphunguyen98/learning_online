import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/home/widgets/widget_header_home.dart';
import 'package:learning_online/features/home/widgets/widget_home_teacher_item.dart';
import 'package:learning_online/model/teacher.dart';

import '../logic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WidgetHeaderHome(),
          _buildListOfTeacher(),
        ],
      ),
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
              const Spacer(),
              Text(
                'Tất cả',
                style: kFontRegularPrimary_14,
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.chevron_right,
                color: kPrimaryColor,
              ),
            ],
          ),
          const SizedBox(height: 16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) => WidgetHomeTeacherItem(
              teacherModel: index % 2 == 0 ? TeacherModel.mock : TeacherModel.mock1,
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}
