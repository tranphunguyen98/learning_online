import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class WidgetSearchTextField extends StatelessWidget {
  final String? hint;
  final String? validator;
  final Function(String value)? onChanged;
  const WidgetSearchTextField({Key? key, this.hint, this.validator, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
          TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: kFontRegularDefault_14.copyWith(color: Colors.grey),
              // contentPadding: EdgeInsets.symmetric(
              //   horizontal: 24,
              // ),
              prefixIcon: const Icon(
                Icons.search,
                size: 16,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              // fillColor: Colors.grey.shade100,
              // filled: true,
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(
              //     Radius.circular(12),
              //   ),
              //   borderSide: BorderSide(color: Colors.transparent),
              // ),
              disabledBorder: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
