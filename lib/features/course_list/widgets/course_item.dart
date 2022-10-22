import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

import '../../../utils/router.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouter.kCourseDetail);
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
                'https://camblycurriculumicons.s3.amazonaws.com/5e2b895e541a832674533c18?h=d41d8cd98f00b204e9800998ecf8427e'),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Advanced Conversation Topics',
                    style: kFontMediumBlack_12,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Gain confidence speaking about familiar topics',
                    style: kFontRegularDefault_10.copyWith(
                      color: kGrayColor,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Advanced - 10 Lessons',
                    style: kFontRegularDefault_10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
