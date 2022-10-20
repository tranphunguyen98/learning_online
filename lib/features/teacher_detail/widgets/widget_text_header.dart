import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class WidgetTextHeader extends StatelessWidget {
  final String title;
  const WidgetTextHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      color: Colors.grey.withOpacity(0.1),
      alignment: Alignment.center,
      child: Text(
        title,
        style: kFontSemiboldBlack_16,
      ),
    );
  }
}
