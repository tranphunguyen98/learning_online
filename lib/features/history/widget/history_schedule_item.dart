import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rating_bar_indicator.dart';
import 'package:learning_online/features/history/data/history.dart';
import 'package:learning_online/features/schedule/widget/expansion_area.dart';
import 'package:learning_online/features/schedule/widget/widget_schedule_tutor.dart';

class HistoryScheduleItem extends StatelessWidget {
  final MyHistory history;

  const HistoryScheduleItem({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tutorInfo = history.scheduleDetailInfo?.scheduleInfo?.tutorInfo;

    DateFormat formatHour = DateFormat('HH:mm');
    DateFormat formatDay = DateFormat('dd');
    DateFormat formatMonth = DateFormat('MM yyyy');

    final startDay =
    DateTime.fromMillisecondsSinceEpoch(history.scheduleDetailInfo?.startPeriodTimestamp ?? 0);
    final endDay =
    DateTime.fromMillisecondsSinceEpoch(history.scheduleDetailInfo?.endPeriodTimestamp ?? 0);
    final dateText = '${formatDay.format(startDay)} ${'Tháng'.tr} ${formatMonth.format(startDay)}';

    final now = DateTime.now();
    final difference = now.difference(endDay);
    String agoText = '';
    if (difference.inDays > 0) {
      final days = difference.inDays;
      final years = days ~/ 365;
      if (years > 0) {
        agoText = '$years ${'năm trước'.tr}';
      } else {
        final months = days ~/ 30;
        if (months > 0) {
          agoText = '$months ${'tháng trước'.tr}';
        } else {
          agoText = '$days ${'ngày trước'.tr}';
          ;
        }
      }
    } else {
      if (difference.inHours > 0) {
        if(difference.inHours == 1) {
          agoText = '${difference.inHours} ${'giờ trước'.tr}';
        } else {
          agoText = '${difference.inHours}${' giờ trước'.tr}';
        }
      } else if (difference.inMinutes > 0) {
        agoText = '${difference.inMinutes} ${'phút trước'.tr}';
      } else {
        agoText = '${difference.inSeconds} giây trước';
      }
    }

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
            agoText,
            style: kFontRegularDefault_12,
          ),
          const SizedBox(height: 16),
          if (tutorInfo != null)
            WidgetScheduleTutor(
              tutor: tutorInfo,
            ),
          Card(
            elevation: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'Thời gian học'.tr}: ${lessonTimeText}',
                    style: kFontRegularDefault_14.copyWith(fontWeight: FontWeight.w500),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: const [
                  //       Icon(Icons.smart_display_outlined, size: 16,),
                  //       SizedBox(width: 6),
                  //       Text('Bản ghi')
                  //     ],
                  //   ),
                  // ),
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
                  padding: EdgeInsets.only(top: 8.0, left: 12, right: 12, bottom: 12),
                  child: HistoryExpansionArea(
                    title: 'Yêu cầu cho buổi học'.tr,
                    content: (history.studentRequest?.isNotEmpty ?? false)
                        ? history.studentRequest ?? ''
                        : 'Không có yêu cầu cho buổi học'.tr,
                  ),
                ),
                Container(
                  height: 1,
                  color: kLightGrayColor,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 12, right: 12, bottom: 12),
                  child: HistoryExpansionArea(title: 'Đánh giá từ gia sư'.tr,
                      content: history.classReviewText
                  ),
                ),
                Container(
                  height: 1,
                  color: kLightGrayColor,
                ),
                if(history.feedbacks?.isNotEmpty ?? false)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text('Rating: '),
                      WidgetRatingBarIndicator(
                        star: history.feedbacks?.first.rating?.toDouble() ?? 0.0,
                        itemSize: 16,
                      ),
                    ],),
                  )
                // Padding(
                //   padding: const EdgeInsets.only(top: 12.0, left: 12, right: 12, bottom: 12),
                //   child: Row(
                //     children: [
                //       Text(
                //         'Đánh giá',
                //         style: kFontRegularBlue_12,
                //       ),
                //       const Spacer(),
                //       Text(
                //         'Báo cáo',
                //         style: kFontRegularBlue_12,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

}
