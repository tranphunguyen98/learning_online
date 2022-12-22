import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class WidgetRoundedTextField extends StatelessWidget {
  final String? hint;
  final String? Function(String? value)? validator;
  final double? radius;
  final int? minLines;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? textInputType;
  final bool isDisable;

  const WidgetRoundedTextField({
    Key? key,
    this.hint,
    this.validator,
    this.radius,
    this.minLines,
    this.controller,
    this.obscureText = false,
    this.isDisable = false,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: minLines != null ? 48.0 * minLines! : 48,
          decoration: BoxDecoration(
            color: isDisable ? Colors.grey.shade200 : null,
              borderRadius: BorderRadius.all(
                Radius.circular(radius ?? 24),
              ),
              border: Border.all(
                color: Colors.blueGrey,
                width: 0.25,
              )),
        ),
        TextFormField(
          style: kFontRegularDefault_14.copyWith(color: kBlackColor.withOpacity(isDisable ? 0.3 : 1.0)),
          minLines: obscureText ? 1 : minLines,
          maxLines: obscureText ? 1 : minLines,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: obscureText,
          keyboardType: textInputType,
          enabled: !isDisable,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(horizontal: radius != null ? 16 : 24, vertical: 8),
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
