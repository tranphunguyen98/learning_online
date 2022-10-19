import 'package:flutter/material.dart';

import '../core.dart';

class WidgetChip extends StatelessWidget {
  final String text;
  const WidgetChip({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: kBlueColor.withOpacity(0.2),
      label: Text(
        text,
        style: kFontRegularBlue_12,
      ),
    );
  }
}
