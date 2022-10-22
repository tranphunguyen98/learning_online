import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/schedule/widget/expansion_area.dart';
import 'package:learning_online/features/schedule/widget/widget_schedule_tutor.dart';

class HistoryScheduleItem extends StatelessWidget {
  const HistoryScheduleItem({Key? key}) : super(key: key);

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
            '10 giờ trước',
            style: kFontRegularDefault_12,
          ),
          SizedBox(height: 16),
          WidgetScheduleTutor(),
          Card(
            elevation: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thời gian học: 10:00 - 11:00',
                    style: kFontRegularDefault_14.copyWith(fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.smart_display_outlined, size: 16,),
                        SizedBox(width: 6),
                        Text('Bản ghi')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12, right: 12, bottom: 12),
                  child: HistoryExpansionArea(title: 'Yêu cầu cho buổi học'),
                ),
                Container(height: 1, color: kLightGrayColor,),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 12, right: 12, bottom: 12),
                  child: HistoryExpansionArea(title: 'Đánh giá từ gia sư',),
                ),
                Container(height: 1, color: kLightGrayColor,),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12, bottom: 12),
                  child: Row(children: [
                    Text('Đánh giá', style: kFontRegularBlue_12,),
                    Spacer(),
                    Text('Báo cáo', style: kFontRegularBlue_12,),
                  ],),
                ),
              ],
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
