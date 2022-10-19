import 'package:flutter/material.dart';
import 'package:learning_online/core/asset_manager.dart';
import 'package:learning_online/core/colors.dart';

class WidgetLogoText extends StatelessWidget {
  const WidgetLogoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          CoreImages.imgLogo,
          height: 80,
          width: 80,
        ),
        SizedBox(height: 8),
        Text(
          'LET TUTOR',
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
