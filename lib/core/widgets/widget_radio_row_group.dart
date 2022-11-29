import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class WidgetRadioRowGroup extends StatefulWidget {
  final List<String> data;
  final String Function(String key) displayText;
  final Function(String value)? onValueChanged;
  const WidgetRadioRowGroup({Key? key, required this.data, this.onValueChanged, required this.displayText})
      : super(key: key);

  @override
  _WidgetRadioRowGroupState createState() => _WidgetRadioRowGroupState();
}

class _WidgetRadioRowGroupState extends State<WidgetRadioRowGroup> {
  late String selectedItem;

  @override
  void initState() {
    selectedItem = widget.data.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: widget.data.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, int) => const SizedBox(width: 4),
      itemBuilder: (context, index) {
        final String item = widget.data[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedItem = item;
            });
            return widget.onValueChanged?.call(item);
          },
          child: Chip(
            label: Text(
              widget.displayText(item),
              style: kFontRegularDefault_12.copyWith(
                  color: item == selectedItem ? Colors.blue : Colors.black54),
            ),
            backgroundColor: item == selectedItem
                ? Colors.blue.shade100
                : Colors.grey.shade100,
          ),
        );
      },
    );
  }
}
