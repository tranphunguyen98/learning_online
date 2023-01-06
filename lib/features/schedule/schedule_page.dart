import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/history/widget/schedule_item.dart';
import 'package:learning_online/features/schedule/schedule_logic.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final ScheduleLogic controller = Get.put(ScheduleLogic());

  @override
  void initState() {
    controller.getSchedule();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('Lịch đã đặt', style: kFontSemiboldBlack_22,),
            const SizedBox(height: 8),
            Expanded(
              child: GetBuilder<ScheduleLogic>(
                init: controller,
                builder: (logic) {
                  if(logic.isLoaded) {
                    if(logic.schedules.isNotEmpty) {
                      return ListView.separated(
                        itemBuilder: (_, i) => ScheduleItem(schedule: logic.schedules[i],),
                        separatorBuilder: (_, i) => const SizedBox(height: 16),
                        itemCount: logic.schedules.length,
                      );
                    } else {
                     return Center(child: Text('Lịch học rỗng'));
                    }
                  }
                  return Center(child: CircularProgressIndicator(),);
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
