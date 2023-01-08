import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_multi_line_text_field.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/features/root_controller.dart';
import 'package:learning_online/features/teacher_detail/teacher_detail_logic.dart';
import 'package:learning_online/utils/dateExtension.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class WidgetSchedule extends StatefulWidget {
  final String tutorId;

  const WidgetSchedule({
    Key? key,
    required this.tutorId,
  }) : super(key: key);

  @override
  _WidgetSheduleState createState() => _WidgetSheduleState();
}

class _WidgetSheduleState extends State<WidgetSchedule> {
  TeachDetailLogic controller = Get.find<TeachDetailLogic>();
  TextEditingController noteController = TextEditingController();
  late DateTime startTime;
  late DateTime endTime;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    startTime = DateTime(now.year, now.month, now.day);
    endTime = startTime.add(Duration(days: 6));
    controller.getCalendar(
        widget.tutorId, startTime.millisecondsSinceEpoch, endTime.millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeachDetailLogic>(builder: (logic) {
      DateFormat formatHour = DateFormat('HH:mm');
      DateFormat formatMonth = DateFormat('MM, yyyy');
      DateFormat formatMonthOnly = DateFormat('MM');
      DateFormat formatDayMonth = DateFormat('dd/MM');

      String dateText = '';
      if (startTime.month != endTime.month && startTime.year == endTime.year) {
        dateText =
            '${'Tháng'.tr} ${formatMonthOnly.format(startTime)} - ${'Tháng'.tr} ${formatMonth.format(endTime)}';
      } else if (startTime.month != endTime.month && startTime.year != endTime.year) {
        dateText = '${'Tháng'.tr} ${formatMonth.format(startTime)} - ${'Tháng'.tr} ${formatMonth.format(endTime)}';
      } else {
        dateText = '${'Tháng'.tr} ${formatMonth.format(startTime)}';
      }

      final rowsLength = 48;
      final bookings = logic.bookings;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 28,
                width: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.only()),
                  onPressed: () {},
                  child: Text(
                    'Today',
                    style: kFontRegularWhite_10,
                  ),
                ),
              ),
              SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.chevron_left,
                  size: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.chevron_right,
                  size: 16,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 4),
              Text(
                dateText,
                style: kFontRegularDefault_12,
              )
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 36 * 12 + 48,
            child: StickyHeadersTable(
              cellDimensions: CellDimensions.fixed(
                contentCellWidth: 80,
                contentCellHeight: 36,
                stickyLegendWidth: 80,
                stickyLegendHeight: 48,
              ),
              columnsLength: 7,
              rowsLength: rowsLength,
              columnsTitleBuilder: (i) {
                final _day = startTime.add(Duration(days: i));
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.3, color: kLightGrayColor),
                  ),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            formatDayMonth.format(_day),
                            style: kFontRegularDefault_11.copyWith(color: Colors.black54),
                          ),
                          Text(
                            _day.toDayText,
                            style: kFontRegularDefault_11.copyWith(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              rowsTitleBuilder: (i) {
                final _startDay = startTime.add(Duration(minutes: 30 * i));
                final _endDay = _startDay.add(Duration(minutes: 25));
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey.withOpacity(0.1),
                  child: Center(
                      child: Text(
                    '${formatHour.format(_startDay)} - ${formatHour.format(_endDay)}',
                    style: kFontSemiboldBlack_11.copyWith(color: Colors.black54),
                  )),
                );
              },
              contentCellBuilder: (columnIndex, rowIndex) {
                final _startDay =
                    startTime.add(Duration(days: columnIndex, minutes: 30 * rowIndex));
                final _startDayTimestamp = _startDay.millisecondsSinceEpoch;
                final booking = bookings
                    .firstWhereOrNull((element) => element.startTimestamp == _startDayTimestamp);

                Widget? _child;
                String scheduleId = '';
                if (booking != null) {
                  if (booking.isBooked ?? false) {
                    bool isOtherBooked = false;
                    if (booking.scheduleDetails?.isNotEmpty ?? false) {
                      final details = booking.scheduleDetails!.first.bookingInfo;
                      if (details?.isNotEmpty ?? false) {
                        final detail = details!.last;
                        final user = Get.find<RootController>().user;
                        if (detail.userId != user?.id) {
                          isOtherBooked = true;
                        }
                      }
                    }
                    if (isOtherBooked) {
                      _child = Text(
                        'Đã được đặt'.tr,
                        style: kFontRegularBlue_12.copyWith(color: Colors.black45),
                      );
                    } else {
                      _child = Text(
                        'Đã đặt'.tr,
                        style: kFontRegularBlue_12.copyWith(color: Colors.green),
                      );
                    }
                  } else {
                    if (booking.scheduleDetails?.isNotEmpty ?? false) {
                      scheduleId = booking.scheduleDetails!.first.id ?? '';
                    }
                    _child = _buildBookingButton(_startDay, scheduleId);
                  }
                }
                // if (columnIndex > 0 && rowIndex < 2) {
                //   _child = _buildBookingButton();
                // } else if (columnIndex == 0 && rowIndex < 3) {
                //   _child = Text(
                //     'Đã đặt',
                //     style: kFontRegularBlue_12,
                //   );
                // }

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.3, color: kLightGrayColor),
                  ),
                  child: Center(child: _child),
                );
              },
              legendCell: Container(
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
          ),
        ],
      );
    });
    // return Column(
    //   children: [
    //     Row(
    //       children: [
    //         ElevatedButton(
    //           onPressed: () {},
    //           child: Text('Today'),
    //         ),
    //         Icon(
    //           Icons.keyboard_arrow_left,
    //           size: 16,
    //           color: Colors.grey,
    //         )
    //       ],
    //     ),
    //     StickyHeadersTable(
    //       columnsLength: 5,
    //       rowsLength: 5,
    //       columnsTitleBuilder: (i) => const Text('column'),
    //       rowsTitleBuilder: (i) => const Text('row'),
    //       contentCellBuilder: (columnIndex, rowIndex) {
    //         if (columnIndex == 1 && rowIndex == 1) {
    //           return const WidgetRoundedButton(text: 'Đặt lịch');
    //         } else if (columnIndex == 2 && rowIndex == 1) {
    //           return Text(
    //             'Đã đặt',
    //             style: kFontRegularBlue_12,
    //           );
    //         }
    //         return Text('cell$columnIndex-$rowIndex');
    //       },
    //       legendCell: const Text('Sticky Legend'),
    //     ),
    //   ],
    // );
  }

  SizedBox _buildBookingButton(DateTime startDay, String scheduleId) {
    final _isOverTime = startDay.difference(DateTime.now()).isNegative;
    return SizedBox(
      height: 24,
      width: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(),
            backgroundColor: _isOverTime ? Colors.grey : kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
        onPressed: _isOverTime
            ? null
            : () {
                showDialog(
                    context: context,
                    builder: (dialogContext) {
                      DateFormat formatHour = DateFormat('HH:mm');
                      DateFormat formatDay = DateFormat('dd');
                      DateFormat formatMonth = DateFormat('MM, yyyy');
                      final _endDay = startDay.add(Duration(minutes: 25));
                      final _dateText =
                          '${formatHour.format(startDay)} - ${formatHour.format(_endDay)} ${startDay.toDayText}, ${formatDay.format(startDay)} tháng ${formatMonth.format(startDay)}';

                      final user = Get.find<RootController>().user;
                      final amount = (int.tryParse(user?.walletInfo?.amount ?? '0') ?? 0) ~/ 100000;
                      return AlertDialog(
                        contentPadding: EdgeInsets.only(),
                        insetPadding: EdgeInsets.only(left: 16, right: 16),
                        content: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0, top: 16),
                                child: Text(
                                  'Chi tiết đặt lịch',
                                  style: kFontSemiboldBlack_16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.3, color: kLightGrayColor),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            color: Colors.grey.withOpacity(0.1),
                                            child: Text(
                                              'Thời gian đặt lịch',
                                              style: kFontSemiboldBlack_14,
                                            ),
                                          ),
                                          Container(
                                            height: 0.3,
                                            color: kLightGrayColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              _dateText,
                                              style: kFontRegularBlue_12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        border: Border.all(width: 0.3, color: kLightGrayColor),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Số dư',
                                                  style: kFontSemiboldBlack_14,
                                                ),
                                                Spacer(),
                                                Text(
                                                  'Bạn còn $amount buổi học',
                                                  style: kFontRegularBlue_12,
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 0.3,
                                            color: kLightGrayColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'Giá',
                                                  style: kFontSemiboldBlack_14,
                                                ),
                                                Spacer(),
                                                Text(
                                                  '1 buổi học',
                                                  style: kFontRegularBlue_12,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 0.3, color: kLightGrayColor),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            color: Colors.grey.withOpacity(0.1),
                                            child: Text(
                                              'Notes',
                                              style: kFontSemiboldBlack_14,
                                            ),
                                          ),
                                          Container(
                                            height: 0.3,
                                            color: kLightGrayColor,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: WidgetMultiLineTextField(
                                              controller: noteController,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            side: const BorderSide(color: kBlueColor),
                                            backgroundColor: Colors.white.withOpacity(0.2),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(dialogContext);
                                          },
                                          child: Text('Hủy'),
                                        ),
                                        SizedBox(width: 8),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    amount > 0 ? kPrimaryColor : kGrayColor),
                                            onPressed: amount <= 0 ? null : () async {
                                              final message = await controller.booking(scheduleId, noteController.text);
                                              if(message == 'Book successful') {
                                                controller.getCalendar(
                                                    widget.tutorId, startTime.millisecondsSinceEpoch, endTime.millisecondsSinceEpoch);
                                                controller.getUserInfo();
                                                Navigator.pop(dialogContext);
                                                showDialog(
                                                    context: context,
                                                    builder: (_context) {
                                                      return AlertDialog(
                                                        title: const Text('Đặt lịch học thành công'),
                                                        content: const Text(
                                                            'Chúc mừng bạn đã đặt lịch học thành công'),
                                                        actions: [
                                                          OutlinedButton(
                                                              onPressed: () {
                                                                Navigator.pop(_context);
                                                              },
                                                              child: const Text('OK'))
                                                        ],
                                                      );
                                                    });
                                              } else {
                                                Navigator.pop(dialogContext);
                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  content: Text(message),
                                                ));
                                              }
                                            },
                                            child: Text('Đặt lịch'.tr))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
        child: Text(
          'Đặt lịch'.tr,
          style: _isOverTime
              ? kFontRegularWhite_10.copyWith(color: Colors.black45)
              : kFontRegularWhite_10,
        ),
      ),
    );
  }
}
