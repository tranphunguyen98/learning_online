import 'package:flutter/material.dart';
import 'package:learning_online/core/widgets/widget_core_app_bar.dart';

import '../../core/colors.dart';
import '../../core/styles.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({Key? key}) : super(key: key);

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.network(
                  'https://camblycurriculumicons.s3.amazonaws.com/5e2b895e541a832674533c18?h=d41d8cd98f00b204e9800998ecf8427e'),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Advanced Conversation Topics',
                    style: kFontMediumBlack_16,
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Gain confidence speaking about familiar topics',
                    style: kFontRegularDefault_12.copyWith(
                      color: kGrayColor,
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Khám phá'),
                  ),
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
          SizedBox(height: 6),
          _buildRowTitle(Icons.question_mark, 'Tại sao bạn nên học khóa học này', Colors.red),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you\'ve mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.',
              style: kFontRegularDefault_12,
            ),
          ),
          SizedBox(height: 8),
          _buildRowTitle(Icons.question_mark, 'Tại sao bạn nên học khóa học này', Colors.red),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'It can be intimidating to speak with a foreigner, no matter how much grammar and vocabulary you\'ve mastered. If you have basic knowledge of English but have not spent much time speaking, this course will help you ease into your first English conversations.',
              style: kFontRegularDefault_12,
            ),
          ),
          SizedBox(height: 16),
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
          SizedBox(width: 8),
          Expanded(
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
        SizedBox(width: 4),
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
          SizedBox(height: 16),
          _buildRowTitle(Icons.person_outline, 'Beginner', Colors.blueAccent),
          SizedBox(height: 16),
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
          SizedBox(height: 16),
          _buildRowTitle(Icons.book_outlined, '10 Chủ đề', Colors.blueAccent),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildListSubject() {
    return Column(
      children: [
        _buildTitle('Danh sách chủ đề'),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildItemSubject(),
              _buildItemSubject(),
              _buildItemSubject(),
            ],
          ),
        ),
      ],
    );
  }

  OutlinedButton _buildItemSubject() {
    return OutlinedButton(
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '1.  Foods You Love',
                    style: kFontSemiboldBlack_14.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            );
  }
}
