import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_chip.dart';
import 'package:learning_online/model/teacher.dart';

class WidgetTeacherItem extends StatelessWidget {
  const WidgetTeacherItem({Key? key, required this.teacherModel})
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            teacherModel.name,
                            style: kFontRegularDefault_16,
                          ),
                          Spacer(),
                          Text(
                            '${teacherModel.star}',
                            style: kFontRegularRed_16,
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
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
                            return WidgetChip(text: teacherModel.fields[index]);
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
