import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_core_dropdown.dart';

class WidgetDropdownWithTitle extends StatelessWidget {
  final String title;
  final List<String> data;
  final String? hint;
  const WidgetDropdownWithTitle(
      {Key? key, required this.title, required this.data, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: kFontRegularDefault_14,
        ),
        const SizedBox(height: 8),
        WidgetCoreDropdown(
          data: data,
          hint: hint,
        ),
      ],
    );
  }
}
