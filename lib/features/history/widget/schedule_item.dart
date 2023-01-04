import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/schedule/data/history_schedule.dart';
import 'package:learning_online/features/schedule/schedule_logic.dart';
import 'package:learning_online/features/schedule/widget/widget_schedule_tutor.dart';

import 'history_expansion_area.dart';

class ScheduleItem extends StatelessWidget {
  final MySchedule schedule;
  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tutorInfo = schedule.tutorInfo;

    DateFormat formatHour = DateFormat('HH:mm');
    DateFormat formatDay = DateFormat('dd');
    DateFormat formatMonth = DateFormat('MM yyyy');

    final startDay = DateTime.fromMillisecondsSinceEpoch(schedule.dates.first.startDay);
    final endDay = DateTime.fromMillisecondsSinceEpoch(schedule.dates.last.endDay);
    final dateText = '${formatDay.format(startDay)} Tháng ${formatMonth.format(startDay)}';
    final lessonTimeText = '${formatHour.format(startDay)} - ${formatHour.format(endDay)}';

    return Container(
      padding: const EdgeInsets.only(top: 16, left: 10, right: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dateText,
            style: kFontSemiboldBlack_16,
          ),
          const SizedBox(height: 6),
          Text(
            schedule.dates.length > 1 ? '${schedule.dates.length} buồi học liên tục' : '1 buổi học',
            style: kFontRegularDefault_12,
          ),
          const SizedBox(height: 16),
          if(tutorInfo != null)
          WidgetScheduleTutor(tutor: tutorInfo,),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian học: $lessonTimeText',
                    style: kFontRegularDefault_14.copyWith(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(),
                    itemBuilder: (_, index) => _widgetRowTime(index, schedule.dates[index]),
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemCount: schedule.dates.length,
                  ),
                  const SizedBox(height: 8),
                  ExpansionArea(request: schedule.studentRequest,),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 2.0, bottom: 4),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: kBlueColor),
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
                onPressed: () {},
                child: const Text('Vào buổi học'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetRowTime(int index, MyDate date) {

    DateFormat formatHour = DateFormat('HH:mm');
    final startDay = DateTime.fromMillisecondsSinceEpoch(date.startDay);
    final endDay = DateTime.fromMillisecondsSinceEpoch(date.endDay);
    final lessonTimeText = '${formatHour.format(startDay)} - ${formatHour.format(endDay)}';

    return Row(
      children: [
        Expanded(
          child: Text(
            'Buổi ${index + 1}: $lessonTimeText',
            style: kFontRegularDefault_13,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: Colors.red)),
          child: Row(
            children: [
              const Icon(
                Icons.cancel,
                size: 12,
                color: Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                'Hủy',
                style: kFontRegularDefault_12.copyWith(color: Colors.red),
              )
            ],
          ),
        )
      ],
    );
  }
}
