import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/history/widget/schedule_item.dart';
import 'package:learning_online/features/schedule/widget/history_schedule_item.dart';

import '../../core/widgets/widget_core_app_bar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widgetCoreAppBar(title: 'Lịch sử các buổi học', context: context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (_, i) => HistoryScheduleItem(),
          separatorBuilder: (_, i) => SizedBox(height: 16),
          itemCount: 3,
        ),
      ),
    );
  }
}
