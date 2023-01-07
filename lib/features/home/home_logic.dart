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
      booking = schedule.data!.last;
    }

    update();

  }

}
