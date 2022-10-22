import 'package:flutter/material.dart';
import 'package:learning_online/core/styles.dart';
import 'package:learning_online/features/course_list/widgets/course_item.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0, bottom: 4),
                  child: Text('English For Traveling', style: kFontMediumBlack_18,),
                ),
                Row(
                  children: [
                    Expanded(child: CourseItem()),
                    Expanded(child: CourseItem()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CourseItem()),
                    Expanded(child: CourseItem()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0, bottom: 4),
                  child: Text('English For Traveling', style: kFontMediumBlack_18,),
                ),
                Row(
                  children: [
                    Expanded(child: CourseItem()),
                    Expanded(child: CourseItem()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: CourseItem()),
                    Expanded(child: CourseItem()),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
