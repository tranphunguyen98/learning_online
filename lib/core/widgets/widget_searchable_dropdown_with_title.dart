import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/searchable_dropdown_widget.dart';
import 'package:learning_online/core/widgets/widget_core_dropdown.dart';
import 'package:learning_online/core/widgets/widget_searchable_dropdown.dart';
import 'package:learning_online/utils/data.dart';

class WidgetSearchableDropdownWithTitle<T> extends StatelessWidget {
  final String title;
  final String? hint;
  final T? selected;
  final List<T> items;
  final Function(T value) onSelected;
  final String Function(T value) onDisplay;
  const WidgetSearchableDropdownWithTitle({
    Key? key,
    required this.title,
    this.hint,
    required this.selected,
    required this.onSelected, required this.items, required this.onDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('* ', style: TextStyle(color: Colors.red),),
            Text(
              title,
              style: kFontRegularDefault_14,
            ),
          ],
        ),
        const SizedBox(height: 8),
        SearchableDropdownNew<T>(
          valueShow: onDisplay,
          items: items,
          selectedItemIndex: selected,
          onChanged: (value) => onSelected.call(value),
          hintText: hint,
        ),
      ],
    );
  }
}
