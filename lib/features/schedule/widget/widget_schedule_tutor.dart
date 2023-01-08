import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/utils/data.dart';

import '../data/history_schedule.dart';

class WidgetScheduleTutor extends StatelessWidget {
  final TutorInfo tutor;
  const WidgetScheduleTutor({Key? key, required this.tutor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? nationalData =
    nations.firstWhereOrNull((element) => element['code'] == tutor.country);
    final nameData = nationalData?['name'] ?? '';
    String name = '';
    if (nameData is String) {
      name = nameData;
    }
    String flag = nationalData?['flag'] ?? '';
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                tutor.avatar ?? '',
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tutor.name ?? '',
                      style: kFontSemiboldBlack_14,
                    ),
                    Row(
                      children: [
                        Image.network(
                          flag,
                          height: 12,
                        ),
                        const SizedBox(width: 6),
                        Text(name, style: kFontRegularDefault_12,)
                      ],
                    ),
                    Row(children: [
                      const Icon(Icons.message_outlined, color: kBlueColor, size: 12,),
                      const SizedBox(width: 6),
                      Text('Nhắn tin'.tr, style: kFontRegularBlue_12,)
                    ],)
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
