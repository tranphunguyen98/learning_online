import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_chip.dart';
import 'package:learning_online/core/widgets/widget_multi_line_text_field.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_text_header.dart';

class ReportDialog extends StatefulWidget {
  final String teacherName;

  const ReportDialog({Key? key, required this.teacherName}) : super(key: key);

  @override
  State<ReportDialog> createState() => _ReportDialogState();
}

class _ReportDialogState extends State<ReportDialog> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final paddingBottom = MediaQuery.of(context).viewInsets.bottom;
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            WidgetTextHeader(title: 'Báo cáo ${widget.teacherName}'),
            const SizedBox(height: 32),
            Text(
              'Bạn đang gặp phải vấn đề gì?',
              style: kFontSemiboldPrimary_16,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: WidgetMultiLineTextField(
                  validator: (value)  {
                    if (value?.isEmpty ?? true) {
                      return 'Vui lòng nhập lý do';
                    }
                    return null;
                  },
                  controller: controller,
                  minLines: 3,
                  hint: 'Nội dung',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.text = controller.text + 'Tutor này làm phiền tôi';
              },
              child: const WidgetChip(text: 'Tutor này làm phiền tôi'),
            ),
            GestureDetector(
              onTap: () {
                controller.text = controller.text + 'Hồ sơ này là giả mạo';
              },
              child: const WidgetChip(text: 'Hồ sơ này là giả mạo'),
            ),
            GestureDetector(
              onTap: () {
                controller.text = controller.text + 'Ảnh hồ sơ không phù hợp';
              },
              child: const WidgetChip(text: 'Ảnh hồ sơ không phù hợp'),
            ),
            const Divider(height: 1),
            SizedBox(
              height: 64,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  if(_formKey.currentState?.validate() ?? false) {
                    Navigator.pop(context, controller.text);
                  }
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
