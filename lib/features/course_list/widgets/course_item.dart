import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/course_list/data/course.dart';

import '../../../utils/router.dart';

final levelMap = {
  '0': 'Any Level',
  '1': 'Beginner',
  '4': 'Intermediate',
  '7': 'Advanced',
};

class CourseItem extends StatelessWidget {
  final Course course;

  const CourseItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.kCourseDetail, arguments: course);
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              course.imageUrl ?? '',
              height: 120,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (course.name ?? ''),
                      style: kFontMediumBlack_12.copyWith(fontSize: 11),
                    ),
                    Spacer(),
                    const SizedBox(height: 6),
                    Text(
                      (course.description ?? ''),
                      style: kFontRegularDefault_10.copyWith(
                        color: kGrayColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${levelMap[course.level ?? '']}- ${course.topics?.length ?? 0} Lessons',
                      style: kFontRegularDefault_10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
