import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/features/history/history_schedule_logic.dart';
import 'package:learning_online/features/history/widget/history_schedule_item.dart';
import 'package:loadmore/loadmore.dart';

import '../../core/widgets/widget_core_app_bar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryScheduleLogic controller = Get.put(HistoryScheduleLogic());

  @override
  void initState() {
    controller.getHistories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widgetCoreAppBar(title: 'Lịch sử các buổi học', context: context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<HistoryScheduleLogic>(
            init: controller,
            builder: (logic) {
              if (logic.isLoaded) {
                if (logic.histories.isNotEmpty) {
                  final histories = logic.histories;
                  return LoadMore(
                    isFinish: controller.isFinish,
                    textBuilder: (status) {
                      return '';
                    },
                    onLoadMore: () {
                      return controller.loadMore();
                    },
                    child: ListView.separated(
                      itemBuilder: (_, i) => HistoryScheduleItem(
                        history: histories[i],
                      ),
                      separatorBuilder: (_, i) => const SizedBox(height: 16),
                      itemCount: histories.length,
                    ),
                  );
                } else {
                  return Center(child: Text('Lịch sử học rỗng'));
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
