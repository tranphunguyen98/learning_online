import 'package:flutter/material.dart';
import 'package:learning_online/core/asset_manager.dart';
import 'package:learning_online/core/core.dart';

class WidgetRowWithSocial extends StatelessWidget {
  final String title;
  const WidgetRowWithSocial({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: kFontRegularDefault_14),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              CoreIcons.icFacebook,
              width: 36,
              height: 36,
            ),
            SizedBox(width: 16),
            Image.asset(
              CoreIcons.icGoogle,
              width: 36,
              height: 36,
            ),
          ],
        ),
      ],
    );
  }
}
