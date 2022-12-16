import 'package:flutter/material.dart';
import 'package:learning_online/features/teacher_detail/widgets/review_tutor_item.dart';
import 'package:learning_online/model/review_tutor.dart';

class WidgetReviewTutorList extends StatelessWidget {
  final List<ReviewTutorModel> reviewTutors;
  const WidgetReviewTutorList({Key? key, required this.reviewTutors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviewTutors.length,
      itemBuilder: (context, index) {
        return ReviewTutorItem(
          reviewTutorModel: reviewTutors[index],
        );
      },
    );
  }
}
