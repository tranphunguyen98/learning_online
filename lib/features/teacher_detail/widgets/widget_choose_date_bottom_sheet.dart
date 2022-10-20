import 'package:flutter/material.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_text_header.dart';

class WidgetChooseDateBottomSheet extends StatelessWidget {
  const WidgetChooseDateBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        WidgetTextHeader(title: 'Hãy chọn ngày của bạn!'),
        SizedBox(height: 16),
        ...List.generate(
          7,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: WidgetRoundedButton(text: '2021-10-24'),
          ),
        ),
      ],
    );
  }
}
