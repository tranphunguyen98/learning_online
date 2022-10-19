import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class WidgetRoundedTextField extends StatelessWidget {
  final String? hint;
  final String? validator;
  final double? radius;
  final int? minLines;
  const WidgetRoundedTextField(
      {Key? key, this.hint, this.validator, this.radius, this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: minLines != null ? 48.0 * minLines! : 48,
      child: TextFormField(
        style: kFontRegularDefault_14,
        minLines: minLines,
        maxLines: minLines,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.symmetric(
            horizontal: radius != null ? 16 : 24,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 24),
            ),
            borderSide: BorderSide(
              color: Colors.blueGrey,
              width: 0.25,
            ),
          ),
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
