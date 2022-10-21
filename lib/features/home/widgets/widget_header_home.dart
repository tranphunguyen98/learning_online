import 'package:flutter/material.dart';
import 'package:learning_online/core/colors.dart';
import 'package:learning_online/core/core.dart';

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
              'Chào mừng bạn đến với LetTutor',
              style: kFontRegularWhite_16,
            ),
            SizedBox(height: 4),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))),
              onPressed: () {},
              child: Text(
                'Đặt lịch',
                style: kFontRegularDefault,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
