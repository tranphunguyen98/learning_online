import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_favorite.dart';
import 'package:learning_online/core/widgets/widget_rating_bar_indicator.dart';
import 'package:learning_online/model/teacher.dart';

class WidgetHomeTeacherItem extends StatelessWidget {
  const WidgetHomeTeacherItem({Key? key, required this.teacherModel})
      : super(key: key);

  final TeacherModel teacherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(
                    teacherModel.imageUrl,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                teacherModel.name,
                                style: kFontRegularDefault_16,
                              ),
                              SizedBox(height: 4),
                              WidgetRatingBarIndicator(star: teacherModel.star),
                            ],
                          ),
                          WidgetFavorite(isFavorite: teacherModel.isFavorite),
                        ],
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 32,
                        width: double.infinity,
                        child: ListView.separated(
                          itemCount: teacherModel.fields.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Chip(
                              backgroundColor: kBlueColor.withOpacity(0.2),
                              label: Text(
                                teacherModel.fields[index],
                                style: kFontRegularBlue_12,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              teacherModel.description,
              style: kFontRegularDefault_14,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}