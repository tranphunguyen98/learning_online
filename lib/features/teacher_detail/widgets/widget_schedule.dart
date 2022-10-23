import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_rounded_button.dart';
import 'package:table_sticky_headers/table_sticky_headers.dart';

class WidgetSchedule extends StatefulWidget {
  const WidgetSchedule({
    Key? key,
  }) : super(key: key);

  @override
  _WidgetSheduleState createState() => _WidgetSheduleState();
}

class _WidgetSheduleState extends State<WidgetSchedule> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            SizedBox(
              height: 28,
              width: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.only()),
                onPressed: () {},
                child: Text('Today', style: kFontRegularWhite_10,),
              ),
            ),
            SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.chevron_left,
                size: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.chevron_right,
                size: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'Tháng 10, 2022',
              style: kFontRegularDefault_12,
            )
          ],
        ),
        SizedBox(height: 8),
        SizedBox(
          height: 36 * 5 + 48,
          child: StickyHeadersTable(
            cellDimensions: CellDimensions.fixed(
              contentCellWidth: 80,
              contentCellHeight: 36,
              stickyLegendWidth: 80,
              stickyLegendHeight: 48,
            ),
            columnsLength: 7,
            rowsLength: 5,
            columnsTitleBuilder: (i) => Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.3, color: kLightGrayColor),
              ),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '10/10',
                        style: kFontRegularDefault_11.copyWith(color: Colors.black54),
                      ),
                      Text(
                        'T2',
                        style: kFontRegularDefault_11.copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            rowsTitleBuilder: (i) => Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey.withOpacity(0.1),
              child: Center(
                  child: Text(
                '10:00 - 11:00',
                style: kFontSemiboldBlack_11.copyWith(color: Colors.black54),
              )),
            ),
            contentCellBuilder: (columnIndex, rowIndex) {
              Widget? _child;
              if (columnIndex > 0 && rowIndex < 2) {
                _child = SizedBox(
                  height: 24,
                  width: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        )),
                    onPressed: () {},
                    child: Text(
                      'Đặt lịch',
                      style: kFontRegularWhite_10,
                    ),
                  ),
                );
              } else if (columnIndex == 0 && rowIndex < 3) {
                _child = Text(
                  'Đã đặt',
                  style: kFontRegularBlue_12,
                );
              }

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.3, color: kLightGrayColor),
                ),
                child: Center(child: _child),
              );
            },
            legendCell: Container(
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
        ),
      ],
    );
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Today'),
            ),
            Icon(
              Icons.keyboard_arrow_left,
              size: 16,
              color: Colors.grey,
            )
          ],
        ),
        StickyHeadersTable(
          columnsLength: 5,
          rowsLength: 5,
          columnsTitleBuilder: (i) => const Text('column'),
          rowsTitleBuilder: (i) => const Text('row'),
          contentCellBuilder: (columnIndex, rowIndex) {
            if (columnIndex == 1 && rowIndex == 1) {
              return const WidgetRoundedButton(text: 'Đặt lịch');
            } else if (columnIndex == 2 && rowIndex == 1) {
              return Text(
                'Đã đặt',
                style: kFontRegularBlue_12,
              );
            }
            return Text('cell$columnIndex-$rowIndex');
          },
          legendCell: const Text('Sticky Legend'),
        ),
      ],
    );
  }
}
