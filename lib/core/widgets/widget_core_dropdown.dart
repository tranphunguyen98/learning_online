import 'package:flutter/material.dart';

class WidgetCoreDropdown extends StatefulWidget {
  final List<String> data;
  final String? initialValue;
  final String? hint;
  const WidgetCoreDropdown(
      {Key? key, required this.data, this.initialValue, this.hint})
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
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(color: Colors.blueGrey, width: 0.25),
      ),
      child: DropdownButton<String>(
        underline: SizedBox.shrink(),
        value: _selectedValue,
        hint: Text(widget.hint ?? 'Chọn'),
        isExpanded: true,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              _selectedValue = value;
            });
          }
        },
        items: widget.data
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
            .toList(),
      ),
    );
  }
}
