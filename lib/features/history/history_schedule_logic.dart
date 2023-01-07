import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/history/data/history.dart';


class HistoryScheduleLogic extends GetxController {
  List<MyHistory> histories = [];
  bool isLoaded = false;

  Future<void> getHistories() async {
    isLoaded = false;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/booking/list/student?page=1&perPage=20&dateTimeLte=$currentTime&orderBy=meeting&sortBy=desc',
    );

    isLoaded = true;
    histories = History.fromJson(responseData).data?.rows ?? [];

    update();
  }
}
