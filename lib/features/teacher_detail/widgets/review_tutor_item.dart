import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rating_bar_indicator.dart';
import 'package:learning_online/model/review_tutor.dart';

class ReviewTutorItem extends StatelessWidget {
  final ReviewTutorModel reviewTutorModel;
  const ReviewTutorItem({Key? key, required this.reviewTutorModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(reviewTutorModel.imageUrl),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        reviewTutorModel.name,
                        style: kFontRegularDefault_14,
                      ),
                      const Spacer(),
                      WidgetRatingBarIndicator(
                        star: reviewTutorModel.star,
                        itemSize: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    reviewTutorModel.comment,
                    style: kFontRegularDefault_12,
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      reviewTutorModel.date,
                      style: kFontRegularGray_10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
