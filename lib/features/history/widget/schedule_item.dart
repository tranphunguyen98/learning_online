import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
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
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CN, 23 Tháng 10 2022',
            style: kFontSemiboldBlack_16,
          ),
          const SizedBox(height: 6),
          Text(
            '2 buồi học liên tục',
            style: kFontRegularDefault_12,
          ),
          const SizedBox(height: 16),
          const WidgetScheduleTutor(),
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
                  const SizedBox(height: 8),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(),
                    itemBuilder: (_, index) => _widgetRowTime(),
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemCount: 2,
                  ),
                  const SizedBox(height: 8),
                  const ExpansionArea(),
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
