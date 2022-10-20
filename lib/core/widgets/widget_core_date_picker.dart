import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/core.dart';

class WidgetCoreDatePicker extends StatefulWidget {
  final String date;
  final Function(String selectedDate)? onDateSelected;
  const WidgetCoreDatePicker(
      {Key? key, required this.date, this.onDateSelected})
      : super(key: key);

  @override
  _WidgetCoreDatePickerState createState() => _WidgetCoreDatePickerState();
}

class _WidgetCoreDatePickerState extends State<WidgetCoreDatePicker> {
  DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  late DateTime _selectedDate;
  String get _strSelectedDate => _dateFormat.format(_selectedDate);
  @override
  void initState() {
    _selectedDate = DateTime.parse(widget.date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: Colors.blueGrey, width: 0.25),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          _strSelectedDate,
          style: kFontRegularDefault_14,
        ),
      ),
    );
  }
}
