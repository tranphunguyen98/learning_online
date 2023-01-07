import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';

class HistoryExpansionArea extends StatefulWidget {
  final String title;
  final String content;
  const HistoryExpansionArea({
    Key? key, required this.title, required this.content,
  }) : super(key: key);

  @override
  _HistoryExpansionAreaState createState() => _HistoryExpansionAreaState();
}

class _HistoryExpansionAreaState extends State<HistoryExpansionArea> with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  @override
  void initState() {
    _animationController = AnimationController(duration: const Duration(milliseconds: 250), vsync: this);
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _widgetCollapseExpand(),
        ClipRect(
          child: Align(
            alignment: Alignment.bottomLeft,
            heightFactor: _heightFactor.value,
            child: content(),
          ),
        ),
      ],
    );
  }

  Widget _widgetCollapseExpand() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _onTapCollapseExpand,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: kFontRegularDefault_12,
              ),
            ),
            RotationTransition(
              turns: _iconTurns,
              child: const Icon(
                Icons.keyboard_arrow_right,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      child: Text(widget.content),
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
