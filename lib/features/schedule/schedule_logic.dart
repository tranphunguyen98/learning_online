import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/schedule/data/history_schedule.dart';

class MyDate {
  final int startDay;
  final int endDay;

  MyDate({required this.startDay, required this.endDay});
}

class MySchedule {
  final TutorInfo tutorInfo;
  final String studentRequest;
  final List<MyDate> dates;

  MySchedule({
    required this.tutorInfo,
    required this.studentRequest,
    required this.dates,
  });
}

class ScheduleLogic extends GetxController {
  List<MySchedule> schedules = [];

  Future<void> getSchedule() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/booking/list/student?page=1&perPage=20&dateTimeGte=$currentTime&orderBy=meeting&sortBy=asc',
    );

    schedules = [];
    final scheduleData = HistorySchedule.fromJson(responseData).data?.rows ?? [];
    for (var schedule in scheduleData) {
      if(schedules.isNotEmpty) {
        print('nguyentp schedule ==> ${ schedule.scheduleDetailInfo!.startPeriodTimestamp! - schedules.last.dates.last.startDay} ');
      }
        if (schedules.isNotEmpty && schedule.scheduleDetailInfo!.startPeriodTimestamp! - schedules.last.dates.last.startDay ==
            30 * 60 * 1000) {
          schedules.last.dates.add(
            MyDate(
              startDay: schedule.scheduleDetailInfo!.startPeriodTimestamp!,
              endDay: schedule.scheduleDetailInfo!.endPeriodTimestamp!,
            ),
          );
          print('nguyentp ==> ');
        } else {
          schedules.add(
            MySchedule(
              tutorInfo: schedule.scheduleDetailInfo!.scheduleInfo!.tutorInfo!,
              studentRequest: schedule.studentRequest ?? '',
              dates: [
                MyDate(
                  startDay: schedule.scheduleDetailInfo?.startPeriodTimestamp ?? 0,
                  endDay: schedule.scheduleDetailInfo?.endPeriodTimestamp ?? 0,
                )
              ],
            ),
          );
          print('nguyentp ==> ');
        }
    }

    update();
  }
}
