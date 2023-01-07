import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_chip.dart';
import 'package:learning_online/core/widgets/widget_core_dropdown.dart';
import 'package:learning_online/core/widgets/widget_dropdown_with_title.dart';
import 'package:learning_online/core/widgets/widget_multi_line_text_field.dart';
import 'package:learning_online/core/widgets/widget_radio_row_group.dart';
import 'package:learning_online/features/schedule/data/history_schedule.dart';
import 'package:learning_online/features/schedule/schedule_logic.dart';
import 'package:learning_online/features/schedule/widget/widget_schedule_tutor.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_text_header.dart';

import 'history_expansion_area.dart';

class ScheduleItem extends StatefulWidget {
  final MySchedule schedule;

  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);

  @override
  State<ScheduleItem> createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem> {
  var cancelReason = cancelReasons.first;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tutorInfo = widget.schedule.tutorInfo;

    DateFormat formatHour = DateFormat('HH:mm');
    DateFormat formatDay = DateFormat('dd');
    DateFormat formatMonth = DateFormat('MM yyyy');

    final startDay = DateTime.fromMillisecondsSinceEpoch(widget.schedule.dates.first.startDay);
    final endDay = DateTime.fromMillisecondsSinceEpoch(widget.schedule.dates.last.endDay);
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
            widget.schedule.dates.length > 1
                ? '${widget.schedule.dates.length} buồi học liên tục'
                : '1 buổi học',
            style: kFontRegularDefault_12,
          ),
          const SizedBox(height: 16),
          if (tutorInfo != null)
            WidgetScheduleTutor(
              tutor: tutorInfo,
            ),
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
                    itemBuilder: (_, index) =>
                        _widgetRowTime(index, widget.schedule.dates[index], context),
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemCount: widget.schedule.dates.length,
                  ),
                  const SizedBox(height: 8),
                  ExpansionArea(
                    request: widget.schedule.studentRequest,
                  ),
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

  Widget _widgetRowTime(int index, MyDate date, BuildContext context) {
    DateFormat formatHour = DateFormat('HH:mm');
    final startDay = DateTime.fromMillisecondsSinceEpoch(date.startDay);
    final endDay = DateTime.fromMillisecondsSinceEpoch(date.endDay);
    final lessonTimeText = '${formatHour.format(startDay)} - ${formatHour.format(endDay)}';

    DateFormat formatDay = DateFormat('dd');
    DateFormat formatMonth = DateFormat('MM yyyy');

    final dateText = '${formatDay.format(startDay)} Tháng ${formatMonth.format(startDay)}';
    
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Buổi ${index + 1}: $lessonTimeText',
              style: kFontRegularDefault_13,
            ),
          ),
          if (startDay.difference(DateTime.now()).inMinutes > 120)
            GestureDetector(
              onTap: () {
                if (startDay.difference(DateTime.now()).inMinutes > 120) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        final tutorInfo = widget.schedule.tutorInfo;
                        return Dialog(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                WidgetTextHeader(title: 'Hủy buổi học'),
                                const SizedBox(height: 16),
                                CircleAvatar(
                                  radius: 32,
                                  backgroundImage: NetworkImage(
                                    tutorInfo.avatar ?? '',
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(tutorInfo.name ?? '', style: kFontSemiboldBlack_14, ),
                                SizedBox(height: 16),
                                Text('Thời gian học'),
                                SizedBox(height: 6),
                                Text(dateText,  style: kFontSemiboldBlack_14, ),
                                SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        '* ',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      Text(
                                        'Lý do bạn hủy buổi học này là gì?',
                                        style: kFontSemiboldPrimary_16,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: WidgetCoreDropdown(
                                    data:
                                        cancelReasons.map((e) => e['reason'] as String ?? '').toList(),
                                    hint: '',
                                    initialValue: cancelReasons.first['reason'] as String,
                                    onDisplay: (value) {
                                      return cancelReasons.firstWhere(
                                          (element) => element['reason'] == value,
                                          orElse: () => const {})['reason'] as String;
                                    },
                                    onChanged: (value) {
                                      cancelReason = cancelReasons
                                          .firstWhere((element) => element['reason'] == value);
                                    },
                                  ),
                                ),
                                const Divider(height: 1),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: WidgetMultiLineTextField(
                                    controller: controller,
                                    minLines: 3,
                                    hint: 'Ghi chú thêm',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 64,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'Bỏ qua',
                                          style: kFontRegularDefault_14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () async {
                                        final message = await Get.find<ScheduleLogic>().deleteSchedule(
                                            date.scheduleId,
                                            cancelReason['id'] as int,
                                            controller.text);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text(message),
                                          duration: Duration(milliseconds: 1000),
                                        ));
                                      },
                                      child: Text('Xác nhận hủy'),
                                    ),
                                    SizedBox(width: 16),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Bạn chỉ được hủy buổi học trước 2h')));
                }
              },
              child: Container(
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
              ),
            )
        ],
      ),
    );
  }
}
