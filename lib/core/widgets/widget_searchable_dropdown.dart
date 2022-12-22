import 'package:flutter/material.dart';

class WidgetSearchableDropdown extends StatefulWidget {
  final List<String> data;
  final String? initialValue;
  final String? hint;
  final String Function(String value)? onDisplay;
  const WidgetSearchableDropdown(
      {Key? key, required this.data, this.initialValue, this.hint, this.onDisplay})
      : super(key: key);

  @override
  _WidgetSearchableDropdownState createState() => _WidgetSearchableDropdownState();
}

class _WidgetSearchableDropdownState extends State<WidgetSearchableDropdown> {
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
      child: DropdownButton<String>(
        underline: const SizedBox.shrink(),
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
            .map((e) => DropdownMenuItem<String>(value: e, child: Text(widget.onDisplay?.call(e) ?? '')))
            .toList(),
      ),
    );
  }
}
