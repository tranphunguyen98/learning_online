import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/history/widget/schedule_item.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

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
              child: ListView.separated(
                itemBuilder: (_, i) => const ScheduleItem(),
                separatorBuilder: (_, i) => const SizedBox(height: 16),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
