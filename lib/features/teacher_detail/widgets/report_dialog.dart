import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_chip.dart';
import 'package:learning_online/core/widgets/widget_multi_line_text_field.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_text_header.dart';

class ReportDialog extends StatelessWidget {
  final String teacherName;
  const ReportDialog({Key? key, required this.teacherName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).viewInsets.bottom;
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WidgetTextHeader(title: 'Báo cáo $teacherName'),
            const SizedBox(height: 32),
            Text(
              'Bạn đang gặp phải vấn đề gì?',
              style: kFontSemiboldPrimary_16,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: WidgetMultiLineTextField(
                minLines: 3,
                hint: 'Nội dung',
              ),
            ),
            const WidgetChip(text: 'Tutor này làm phiền tôi'),
            const WidgetChip(text: 'Hồ sơ này là giả mạo'),
            const WidgetChip(text: 'Ảnh hồ sơ không phù hợp'),
            const Divider(height: 1),
            SizedBox(
              height: 64,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Báo cáo thành công'),
                    duration: Duration(milliseconds: 1000),
                  ));
                },
                child: Text(
                  'Báo cáo Tutor',
                  style: kFontSemiboldPrimary_16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
