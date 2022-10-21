import 'package:get/get.dart';
import 'package:learning_online/model/schedule.dart';
import 'package:learning_online/model/schedule_data.dart';

class TeachDetailLogic extends GetxController {
  final Schedule schedule = Schedule.fromJson(scheduleData);
}
