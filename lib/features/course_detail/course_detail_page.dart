import 'package:flutter/material.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';
import 'package:learning_online/features/course_list/widgets/course_item.dart';
import 'package:learning_online/utils/router.dart';

import '../../core/colors.dart';
import '../../core/styles.dart';
import '../course_list/data/course.dart';

class CourseDetailPage extends StatefulWidget {
  final Course course;

  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widgetCoreAppBar(context: context, title: 'Chi tiết khóa học'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildCard(),
              _buildGeneral(),
              _buildLevel(),
              _buildSubject(),
              _buildListSubject(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.network(widget.course.imageUrl ?? ''),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.course.name ?? '',
                    style: kFontMediumBlack_16,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.course.description ?? '',
                    style: kFontRegularDefault_14.copyWith(
                      color: kGrayColor,
                    ),
                  ),
                  // const SizedBox(height: 12),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: const Text('Khám phá'),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGeneral() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle('Tổng quan'),
          const SizedBox(height: 6),
          _buildRowTitle(Icons.question_mark, 'Tại sao bạn nên học khóa học này', Colors.red),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.course.reason ?? '',
              style: kFontRegularDefault_12,
            ),
          ),
          const SizedBox(height: 8),
          _buildRowTitle(Icons.question_mark, 'Bạn có thể làm gì?', Colors.red),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.course.purpose ?? '',
              style: kFontRegularDefault_12,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Padding _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Text(
            title,
            style: kFontSemiboldBlack_16,
          ),
          const SizedBox(width: 8),
          const Expanded(
              child: Divider(
            height: 1,
          ))
        ],
      ),
    );
  }

  Row _buildRowTitle(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: kFontMediumBlack_14,
        ),
      ],
    );
  }

  Widget _buildLevel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildTitle('Trình độ yêu cầu'),
          const SizedBox(height: 16),
          _buildRowTitle(
              Icons.person_outline, levelMap[widget.course.level ?? ''] ?? '', Colors.blueAccent),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildSubject() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          _buildTitle('Thời lượng khóa học'),
          const SizedBox(height: 16),
          _buildRowTitle(Icons.book_outlined, '${widget.course.topics?.length ?? 0} Chủ đề',
              Colors.blueAccent),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildListSubject() {
    return Column(
      children: [
        _buildTitle('Danh sách chủ đề'),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(widget.course.topics?.length ?? 0, (index) {
              return _buildItemSubject(index: index, topic: widget.course.topics![index]);
            }),
          ),
        ),
      ],
    );
  }

  OutlinedButton _buildItemSubject({
    required int index,
    required Topics topic,
  }) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRouter.kTopicDetail, arguments: topic);
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            '${index + 1}.  ${topic.name}',
            style: kFontSemiboldBlack_14.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
