import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/home/data/schedule_data.dart';
import 'package:learning_online/features/home/data/total.dart';

class HomeLogic extends GetxController {
  Total? total;
  Booking? booking;

  Future<void> getClass() async {
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/call/total',
    );

    total = Total.fromJson(responseData);

    await getClasses();

    update();
  }

  Future<void> getClasses() async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/booking/next?dateTime=$time',
    );

    final schedule = ScheduleData.fromJson(responseData);

    if(schedule.data?.isNotEmpty ?? false) {
      final datas = schedule.data!;
      datas.sort((a, b) {
        return a.scheduleDetailInfo!.startPeriodTimestamp!.compareTo(b.scheduleDetailInfo!.startPeriodTimestamp!);
      });
      for(var data in datas) {
        if(!DateTime.fromMillisecondsSinceEpoch(data.scheduleDetailInfo?.startPeriodTimestamp ?? 0).difference(DateTime.now()).isNegative)  {
          booking = data;
          break;
        }
      }
    }

    update();

  }

}
