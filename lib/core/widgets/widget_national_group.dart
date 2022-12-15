import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class WidgetNationalGroup extends StatefulWidget {
  final List<String> data;
  final String Function(String key) displayText;
  final Function(List<String> values)? onValueChanged;
  const WidgetNationalGroup({Key? key, required this.data, this.onValueChanged, required this.displayText})
      : super(key: key);

  @override
  _WidgetNationalGroupState createState() => _WidgetNationalGroupState();
}

class _WidgetNationalGroupState extends State<WidgetNationalGroup> {
  late List<String> selectedItems;

  @override
  void initState() {
    selectedItems = [];
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
              if(selectedItems.contains(item)) {
                selectedItems.remove(item);
              } else {
                selectedItems.add(item);
              }
            });
            return widget.onValueChanged?.call(selectedItems);
          },
          child: Chip(
            label: Text(
              widget.displayText(item),
              style: kFontRegularDefault_12.copyWith(
                  color: selectedItems.contains(item)? Colors.blue : Colors.black54),
            ),
            backgroundColor: selectedItems.contains(item)
                ? Colors.blue.shade100
                : Colors.grey.shade100,
          ),
        );
      },
    );
  }
}
