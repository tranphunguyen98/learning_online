import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class WidgetMultiLineTextField extends StatelessWidget {
  final String? hint;
  final String? validator;
  final double? radius;
  final int? minLines;
  const WidgetMultiLineTextField(
      {Key? key, this.hint, this.validator, this.radius, this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius ?? 8),
      ),
      borderSide: const BorderSide(
        color: Colors.blueGrey,
        width: 0.25,
      ),
    );

    return TextFormField(
      style: kFontRegularDefault_14,
      minLines: minLines,
      maxLines: minLines,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: border,
        disabledBorder: border,
        border: border,
      ),
    );
  }
}
