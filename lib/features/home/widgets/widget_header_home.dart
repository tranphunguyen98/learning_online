import 'package:flutter/material.dart';
import 'package:learning_online/core/colors.dart';
import 'package:learning_online/core/core.dart';

import '../../../utils/router.dart';

class WidgetHeaderHome extends StatelessWidget {
  const WidgetHeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: kPrimaryColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Buổi học sắp diễn ra',
              style: kFontRegularWhite_18,
            ),
            SizedBox(height: 8),
            Text(
              '20:00 - 20:25 (23/10/2022)',
              style: kFontRegularWhite_14,
            ),
            SizedBox(height: 4),
            Text(
              'Còn 10 phút 30 giây',
              style: kFontRegularWhite_14.copyWith(color: Colors.amberAccent),
            ),
            SizedBox(height: 4),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.kJitsi);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_circle_outline, color: kBlueColor, size: 16,),
                  SizedBox(width: 8),
                  Text(
                    'Vào lớp học',
                    style: kFontRegularBlue_14,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text('Tổng giờ bạn đã học là 20 giờ', style: kFontRegularWhite_14,)
          ],
        ),
      ),
    );
  }
}
