import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rounded_text_field.dart';

class WidgetRoundedTextFieldWithTitle extends StatelessWidget {
  final String title;
  final bool isRequired;
  final String? hint;
  final double? radius;
  final String? Function(String? value)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? textInputType;
  final bool isDisable;
  const WidgetRoundedTextFieldWithTitle({
    Key? key,
    required this.title,
    this.hint,
    this.isRequired = false,
    this.radius,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.textInputType,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(isRequired)
            Text('* ', style: TextStyle(color: Colors.red),),
            Text(
              title,
              style: kFontRegularDefault_14,
            ),
          ],
        ),
        const SizedBox(height: 8),
        WidgetRoundedTextField(
          hint: hint,
          radius: radius,
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          textInputType: textInputType,
          isDisable: isDisable,
        ),
      ],
    );
  }
}
