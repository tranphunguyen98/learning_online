import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/history/data/history.dart';


class HistoryScheduleLogic extends GetxController {
  List<MyHistory> histories = [];
  bool isLoaded = false;
  int currentPage = 1;
  bool isFinish = false;

  Future<bool> loadMore() async {
    currentPage += 1;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/booking/list/student?page=$currentPage&perPage=15&dateTimeLte=$currentTime&orderBy=meeting&sortBy=desc',
    );

    final historiesData = History.fromJson(responseData).data?.rows ?? [];

    if(historiesData.isNotEmpty) {
      histories.addAll(historiesData);
    } else {
      isFinish = true;
    }

    update();
    return true;
  }

  Future<void> getHistories() async {
    isLoaded = false;
    isFinish = false;
    currentPage = 1;
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/booking/list/student?page=$currentPage&perPage=15&dateTimeLte=$currentTime&orderBy=meeting&sortBy=desc',
    );

    isLoaded = true;
    histories = History.fromJson(responseData).data?.rows ?? [];

    update();
  }
}
