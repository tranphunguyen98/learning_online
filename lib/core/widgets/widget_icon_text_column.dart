import 'package:flutter/material.dart';
import 'package:learning_online/core/colors.dart';

import '../styles.dart';

class WidgetIconTextColumn extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final String text;
  final VoidCallback? onTap;
  const WidgetIconTextColumn(
      {Key? key, required this.iconData, required this.text, this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 24,
            color: color ?? kPrimaryColor,
          ),
          const SizedBox(height: 8),
          Text(text, style: kFontRegularPrimary_14.copyWith(color: color ?? kPrimaryColor)),
        ],
      ),
    );
  }
}
