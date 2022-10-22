import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/features/schedule/widget/schedule_item.dart';

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
            SizedBox(height: 8),
            Text('Lịch đã đặt', style: kFontSemiboldBlack_22,),
            SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, i) => ScheduleItem(),
                separatorBuilder: (_, i) => SizedBox(height: 16),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
