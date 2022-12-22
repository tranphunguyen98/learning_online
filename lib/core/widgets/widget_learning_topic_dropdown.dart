import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_core_dropdown.dart';
import 'package:learning_online/features/profile/data/user.dart';
import 'package:learning_online/utils/data.dart';

class WidgetLearningTopicDropdown extends StatefulWidget {
  final Function(
      List<LearnTopic> topics,
      List<TestPreparation> tests,
      )? onChanged;

  final List<LearnTopic> selectedTopics;
  final List<TestPreparation> selectedTests;

  const WidgetLearningTopicDropdown(
      {Key? key, this.onChanged, required this.selectedTopics, required this.selectedTests})
      : super(key: key);

  @override
  State<WidgetLearningTopicDropdown> createState() => _WidgetLearningTopicDropdownState();
}

class _WidgetLearningTopicDropdownState extends State<WidgetLearningTopicDropdown> {
  List<LearnTopic> selectedTopics = [];
  List<TestPreparation> selectedTests = [];

  @override
  void initState() {
    selectedTopics = widget.selectedTopics;
    selectedTests = widget.selectedTests;
    super.initState();
  }

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
              'Muốn học',
              style: kFontRegularDefault_14,
            ),
          ],
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () async {
            await showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (_) {
                  return StatefulBuilder(
                    builder: (_context, _setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('Subjects'),
                          ),
                          SizedBox(height: 8),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: learnTopics.map(
                                  (e) {
                                final selectIndex =
                                selectedTopics.indexWhere((element) => element.id == e.id);
                                if (selectIndex >= 0) {
                                  return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      _setState(() {
                                        selectedTopics.removeAt(selectIndex);
                                      });
                                    },
                                    child: Container(
                                      color: Colors.blueAccent.shade100.withOpacity(0.4),
                                      width: double.infinity,
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                                      child: Text(e.name ?? ''),
                                    ),
                                  );
                                }
                                return GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    _setState(() {
                                      selectedTopics.add(e);
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                                    child: Text(e.name ?? ''),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('Luyện thi'),
                          ),
                          SizedBox(height: 8),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: tests.map(
                                  (e) {
                                final selectIndex =
                                selectedTests.indexWhere((element) => element.id == e.id);
                                if (selectIndex >= 0) {
                                  return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      _setState(() {
                                        selectedTests.removeAt(selectIndex);
                                      });
                                    },
                                    child: Container(
                                      color: Colors.blueAccent.shade100.withOpacity(0.4),
                                      width: double.infinity,
                                      padding:
                                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                                      child: Text(e.name ?? ''),
                                    ),
                                  );
                                }
                                return GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    _setState(() {
                                      selectedTests.add(e);
                                    });
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32),
                                    child: Text(e.name ?? ''),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ],
                      );
                    },
                  );
                });
            setState(() {
              widget.onChanged?.call(selectedTopics, selectedTests);
            });
          },
          child: Container(
            constraints: const BoxConstraints(minHeight: 48),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(color: Colors.blueGrey, width: 0.25),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      selectedTests.isNotEmpty || selectedTests.isNotEmpty ? '${selectedTopics.map((
                          e) => e.name).join(', ')}${selectedTopics.isNotEmpty &&
                          selectedTests.isNotEmpty ? ', ' : ''}${selectedTests.map((e) => e.name)
                          .join(', ')}' : 'Chọn môn muốn học',
                      style: kFontRegularDefault_14,
                    ),
                  ),
                ),
                Icon(Icons.arrow_drop_down_outlined),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
