import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/model/message.dart';

class WidgetMessageItem extends StatelessWidget {
  final MessageModel messageModel;
  const WidgetMessageItem({Key? key, required this.messageModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Chip(
          backgroundColor: kPrimaryColor,
          label: Text(
            messageModel.content,
            style: kFontRegularWhite_12,
          ),
        ),
      ],
    );
  }
}
