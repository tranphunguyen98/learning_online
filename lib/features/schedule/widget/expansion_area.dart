import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class ExpansionArea extends StatefulWidget {
  const ExpansionArea({
    Key? key,
  }) : super(key: key);

  @override
  _ExpansionAreaState createState() => _ExpansionAreaState();
}

class _ExpansionAreaState extends State<ExpansionArea> with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    _animationController = AnimationController(duration: Duration(milliseconds: 250), vsync: this);
    _animationController.value = 1;
    _iconTurns = Tween<double>(begin: 0.0, end: 0.25).animate(_animationController);
    _heightFactor = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        border: Border.all(color: Colors.grey.withOpacity(0.6), width: 0.5),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _widgetCollapseExpand(),
          ClipRect(
            child: Align(
              heightFactor: _heightFactor.value,
              child: content(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetCollapseExpand() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _onTapCollapseExpand,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _iconTurns,
              child: Icon(
                Icons.keyboard_arrow_right,
                size: 16,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'Yêu cầu cho buổi học',
              style: kFontRegularDefault_12,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                print('nguyentp ==> ');
              },
              child: Text(
                'Chỉnh sửa yêu cầu',
                style: kFontRegularBlue_12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.3)))),
        padding: const EdgeInsets.only(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Yêu cầu 1'),
              Text('Yêu cầu 2'),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapCollapseExpand() {
    _isExpanded = !_isExpanded;
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}
