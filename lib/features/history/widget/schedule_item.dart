import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/schedule/widget/expansion_area.dart';
import 'package:learning_online/features/schedule/widget/widget_schedule_tutor.dart';

import 'history_expansion_area.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 10, right: 12),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CN, 23 Tháng 10 2022',
            style: kFontSemiboldBlack_16,
          ),
          SizedBox(height: 6),
          Text(
            '2 buồi học liên tục',
            style: kFontRegularDefault_12,
          ),
          SizedBox(height: 16),
          WidgetScheduleTutor(),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian học: 10:00 - 11:00',
                    style: kFontRegularDefault_14.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(),
                    itemBuilder: (_, index) => _widgetRowTime(),
                    separatorBuilder: (_, index) => SizedBox(height: 8),
                    itemCount: 2,
                  ),
                  SizedBox(height: 8),
                  ExpansionArea(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: kBlueColor),
                backgroundColor: Colors.white.withOpacity(0.2),
              ),
              onPressed: () {},
              child: Text('Vào buổi học'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetRowTime() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Buổi 1: 10:00 - 10:25',
            style: kFontRegularDefault_13,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: Colors.red)),
          child: Row(
            children: [
              Icon(
                Icons.cancel,
                size: 12,
                color: Colors.red,
              ),
              SizedBox(width: 4),
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
