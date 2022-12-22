import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/core.dart';

class WidgetCoreDatePicker extends StatelessWidget {
  final String date;
  final Function(String selectedDate)? onDateSelected;
  const WidgetCoreDatePicker({Key? key, required this.date, this.onDateSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: Colors.blueGrey, width: 0.25),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          date,
          style: kFontRegularDefault_14,
        ),
      ),
    );
  }
}