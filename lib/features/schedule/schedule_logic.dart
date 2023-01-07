import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/core/server_failure.dart';
import 'package:learning_online/features/schedule/data/history_schedule.dart';

final cancelReasons = [
  {
    "id": 1,
    "reason": "Reschedule at another time",
    "createdAt": "2022-09-18T09:32:48.044Z",
    "updatedAt": "2022-09-18T09:32:48.044Z"
  },
  {
    "id": 2,
    "reason": "Busy at that time",
    "createdAt": "2022-09-18T09:32:48.044Z",
    "updatedAt": "2022-09-18T09:32:48.044Z"
  },
  {
    "id": 3,
    "reason": "Asked by the tutor",
    "createdAt": "2022-09-18T09:32:48.044Z",
    "updatedAt": "2022-09-18T09:32:48.044Z"
  },
  {
    "id": 4,
    "reason": "Other",
    "createdAt": "2022-09-18T09:32:48.044Z",
    "updatedAt": "2022-09-18T09:32:48.044Z"
  }
];

class MyDate {
  final String scheduleId;
  final int startDay;
  final int endDay;

  MyDate({required this.startDay, required this.endDay, required this.scheduleId});
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
  int currentPage = 1;
  bool isLoaded = false;
  bool isFinish = false;

  Future<String> deleteSchedule(String scheduleDetailId, int cancelReason, String note) async {
    try {
      final responseData = await BaseApi().delete(
        'https://sandbox.api.lettutor.com/booking/schedule-detail',
        {
          "scheduleDetailId": scheduleDetailId,
          "cancelInfo": {
            "cancelReasonId": cancelReason,
            "note": note,
          },
        },
      );
      getSchedule();
      return responseData['message'] ?? 'Đã có lỗi xảy ra';
    } on ServerFailure catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<bool> loadMore() async {
    currentPage += 1;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/booking/list/student?page=$currentPage&perPage=15&dateTimeGte=$currentTime&orderBy=meeting&sortBy=asc',
    );

    final scheduleData = HistorySchedule.fromJson(responseData).data?.rows ?? [];
    if(scheduleData.isEmpty) {
      isFinish = true;
    }
    for (var schedule in scheduleData) {
      if (schedules.isNotEmpty &&
          schedule.scheduleDetailInfo!.startPeriodTimestamp! - schedules.last.dates.last.startDay ==
              30 * 60 * 1000) {
        schedules.last.dates.add(
          MyDate(
            startDay: schedule.scheduleDetailInfo!.startPeriodTimestamp!,
            endDay: schedule.scheduleDetailInfo!.endPeriodTimestamp!,
            scheduleId: schedule.id ?? '',
          ),
        );
      } else {
        schedules.add(
          MySchedule(
            tutorInfo: schedule.scheduleDetailInfo!.scheduleInfo!.tutorInfo!,
            studentRequest: schedule.studentRequest ?? '',
            dates: [
              MyDate(
                startDay: schedule.scheduleDetailInfo?.startPeriodTimestamp ?? 0,
                endDay: schedule.scheduleDetailInfo?.endPeriodTimestamp ?? 0,
                scheduleId: schedule.id ?? '',
              )
            ],
          ),
        );
      }
    }

    update();
    return true;
  }

  Future<void> getSchedule() async {
    isLoaded = false;
    isFinish = false;
    currentPage = 1;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/booking/list/student?page=1&perPage=15&dateTimeGte=$currentTime&orderBy=meeting&sortBy=asc',
    );

    isLoaded = true;
    schedules = [];
    final scheduleData = HistorySchedule.fromJson(responseData).data?.rows ?? [];
    for (var schedule in scheduleData) {
      if (schedules.isNotEmpty) {
        print(
            'nguyentp schedule ==> ${schedule.scheduleDetailInfo!.startPeriodTimestamp! - schedules.last.dates.last.startDay} ');
      }
      if (schedules.isNotEmpty &&
          schedule.scheduleDetailInfo!.startPeriodTimestamp! - schedules.last.dates.last.startDay ==
              30 * 60 * 1000) {
        schedules.last.dates.add(
          MyDate(
            startDay: schedule.scheduleDetailInfo!.startPeriodTimestamp!,
            endDay: schedule.scheduleDetailInfo!.endPeriodTimestamp!,
            scheduleId: schedule.id ?? '',
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
                  scheduleId: schedule.id ?? '',
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
