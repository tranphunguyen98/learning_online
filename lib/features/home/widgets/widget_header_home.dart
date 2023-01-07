import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/home/home_logic.dart';
import 'package:learning_online/features/home/stream/jitsi.dart';

import '../../../utils/router.dart';

class WidgetHeaderHome extends StatefulWidget {
  const WidgetHeaderHome({Key? key}) : super(key: key);

  @override
  State<WidgetHeaderHome> createState() => _WidgetHeaderHomeState();
}

class _WidgetHeaderHomeState extends State<WidgetHeaderHome> {
  final HomeLogic logic = Get.put(HomeLogic());

  @override
  void initState() {
    logic.getClass();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(
        init: logic,
        builder: (logic) {
          final booking = logic.booking;
          return Container(
            height: 200,
            color: kPrimaryColor,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (booking != null)
                    Column(
                      children: [
                        Text(
                          'Buổi học sắp diễn ra',
                          style: kFontRegularWhite_18,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          booking.startEndText,
                          style: kFontRegularWhite_14,
                        ),
                        const SizedBox(height: 4),
                        _Timer(booking.startDay),
                        const SizedBox(height: 4),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
                          onPressed: () {
                            // Navigator.pushNamed(context, AppRouter.kJitsi);
                            JitsiMeetHelper.joinMeeting(
                              booking.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name ?? '',
                              booking.studentMeetingLink ?? '',
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.play_circle_outline,
                                color: kBlueColor,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Vào lớp học',
                                style: kFontRegularBlue_14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  else
                    Text(
                      'Bạn không có buổi học nào.',
                      style: kFontRegularWhite_18,
                    ),
                  const SizedBox(height: 8),
                  Text(
                    logic.total?.totalText ?? '',
                    style: kFontRegularWhite_14,
                  )
                ],
              ),
            ),
          );
        });
  }
}

class _Timer extends StatefulWidget {
  final DateTime? startDay;
  const _Timer(this.startDay, {
    Key? key,
  }) : super(key: key);

  @override
  State<_Timer> createState() => _TimerState();
}

class _TimerState extends State<_Timer> {
  late Timer timer;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        setState(() {

        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var text = '';
    if(widget.startDay != null) {
      final now = DateTime.now();
      final difference = widget.startDay!.difference(now);
      if(difference.isNegative) {
        var hour = '';
        final hours = -difference.inHours;

        if(hours < 10) {
          hour = '0${difference.inHours}';
        } else {
          hour = '${difference.inHours}';
        }

        var minuteText = '';
        final minutes = -difference.inMinutes.remainder(60);
        if(minutes < 10) {
          minuteText = '0${minutes}';
        } else {
          minuteText = '${minutes}';
        }

        var secondText = '';
        final seconds = -difference.inSeconds.remainder(60);
        if(seconds < 10) {
          secondText = '0${seconds}';
        } else {
          secondText = '${seconds}';
        }
        text = 'Giờ học $hour:$minuteText:$secondText';
      } else {
        var hour = '';
        if(difference.inHours < 10) {
          hour = '0${difference.inHours}';
        } else {
          hour = '${difference.inHours}';
        }

        var minuteText = '';
        final minutes = difference.inMinutes.remainder(60);
        if(minutes < 10) {
          minuteText = '0${minutes}';
        } else {
          minuteText = '${minutes}';
        }


        var secondText = '';
        final seconds = difference.inSeconds.remainder(60);
        if(seconds < 10) {
          secondText = '0${seconds}';
        } else {
          secondText = '${seconds}';
        }
        text = 'Còn $hour:$minuteText:$secondText';
      }
    }
    return Text(
      text,
      style: kFontRegularWhite_14.copyWith(color: Colors.amberAccent),
    );
  }
}
