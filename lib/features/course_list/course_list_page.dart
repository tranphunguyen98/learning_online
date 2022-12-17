import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_online/core/styles.dart';
import 'package:learning_online/features/course_list/course_list_logic.dart';
import 'package:learning_online/features/course_list/widgets/course_item.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  final CourseListLogic controller = Get.put(CourseListLogic());

  @override
  void initState() {
    controller.getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CourseListLogic>(
        init: controller,
        builder: (logic) {
          if (logic.categories.isNotEmpty) {
            final cates = logic.categories;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                itemCount: cates.length,
                itemBuilder: (_, index) {
                  final cate = cates[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0, bottom: 8, top: 8),
                        child: Text(
                          cate.title ?? '',
                          style: kFontMediumBlack_22,
                        ),
                      ),
                      Column(
                        children: List.generate((cate.courses!.length / 2).floor(), (index) {
                          final courses = cate.courses!;
                          final firstItem = 2 * index < courses.length ? courses[2 * index] : null;
                          final secondItem =
                              2 * index + 1 < courses.length ? courses[2 * index + 1] : null;
                          return IntrinsicHeight(
                            child: Row(
                              children: [
                                if (firstItem != null)
                                  Expanded(
                                      child: CourseItem(
                                    course: firstItem!,
                                  )),
                                if (secondItem != null)
                                  Expanded(
                                      child: CourseItem(
                                    course: secondItem!,
                                  )),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              ),
              // child: SingleChildScrollView(
              //   child: Column(
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 2.0, bottom: 4),
              //             child: Text('English For Traveling', style: kFontMediumBlack_18,),
              //           ),
              //           Row(
              //             children: const [
              //               Expanded(child: CourseItem()),
              //               Expanded(child: CourseItem()),
              //             ],
              //           ),
              //           Row(
              //             children: const [
              //               Expanded(child: CourseItem()),
              //               Expanded(child: CourseItem()),
              //             ],
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 8),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Padding(
              //             padding: const EdgeInsets.only(left: 2.0, bottom: 4),
              //             child: Text('English For Traveling', style: kFontMediumBlack_18,),
              //           ),
              //           Row(
              //             children: const [
              //               Expanded(child: CourseItem()),
              //               Expanded(child: CourseItem()),
              //             ],
              //           ),
              //           Row(
              //             children: const [
              //               Expanded(child: CourseItem()),
              //               Expanded(child: CourseItem()),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
