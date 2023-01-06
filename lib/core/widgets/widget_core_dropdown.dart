import 'package:flutter/material.dart';

import '../styles.dart';

class WidgetCoreDropdown extends StatefulWidget {
  final List<String> data;
  final String? initialValue;
  final String? hint;
  final String Function(String value) onDisplay;
  final Function(String value) onChanged;

  const WidgetCoreDropdown(
      {Key? key,
      required this.data,
      this.initialValue,
      this.hint,
      required this.onDisplay,
      required this.onChanged})
      : super(key: key);

  @override
  _WidgetCoreDropdownState createState() => _WidgetCoreDropdownState();
}

class _WidgetCoreDropdownState extends State<WidgetCoreDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    _selectedValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: Colors.blueGrey, width: 0.25),
      ),
      child: _selectedValue?.isEmpty ?? true
          ? Align(
              alignment: Alignment.centerLeft,
              child: Text('Chọn trình độ', style: kFontRegularDefault_14,),
            )
          : DropdownButton<String>(
              underline: const SizedBox.shrink(),
              value: _selectedValue,
              hint: Text(widget.hint ?? 'Chọn'),
              isExpanded: true,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedValue = value;
                    widget.onChanged(_selectedValue!);
                  });
                }
              },
              items: widget.data
                  .map((e) => DropdownMenuItem<String>(value: e, child: Text(widget.onDisplay(e))))
                  .toList(),
            ),
    );
  }
}
