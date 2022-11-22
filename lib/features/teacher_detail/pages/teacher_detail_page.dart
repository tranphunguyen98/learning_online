import 'package:flutter/material.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_chip.dart';
import 'package:learning_online/core/widgets/widget_icon_text_column.dart';
import 'package:learning_online/core/widgets/widget_rating_bar_indicator.dart';
import 'package:learning_online/core/widgets/widget_video_player.dart';
import 'package:learning_online/features/teacher_detail/widgets/report_dialog.dart';
import 'package:learning_online/features/teacher_detail/widgets/review_tutor_list.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_choose_date_bottom_sheet.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_schedule.dart';
import 'package:learning_online/model/teacher.dart';

import '../../../utils/router.dart';

class TeacherDetailPage extends StatefulWidget {
  final TeacherModel teacherModel;
  const TeacherDetailPage({Key? key, required this.teacherModel}) : super(key: key);

  @override
  _TeacherDetailPageState createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends State<TeacherDetailPage> {
  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetVideoPlayer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _widgetInfoHeader(),
                const SizedBox(height: 16),
                Text(
                  widget.teacherModel.description,
                  style: kFontRegularDefault_14,
                ),
                const SizedBox(height: 16),
                _widgetRowFunction(),
                const SizedBox(height: 8),
                _widgetTitleChipsColumn('Ngôn ngữ', widget.teacherModel.languages),
                _widgetTitleTextColumn('Học vấn', widget.teacherModel.education),
                _widgetTitleTextColumn('Kinh nghiêm', widget.teacherModel.experience),
                _widgetTitleTextColumn('Sở thích', widget.teacherModel.hobby),
                _widgetTitleTextColumn('Nghề nghiệp', widget.teacherModel.career),
                _widgetTitleChipsColumn('Chuyên môn', widget.teacherModel.fields),
                const SizedBox(height: 16),
                const WidgetSchedule(),
                const SizedBox(height: 16),
                _widgetViewReview(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _widgetViewReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Đánh giá và bình luận (5)',
          style: kFontRegularPrimary_14,
        ),
        const SizedBox(height: 16),
        WidgetReviewTutorList(),
      ],
    );
  }

  Column _widgetTitleTextColumn(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: kFontRegularPrimary_14,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8.0),
          child: Text(
            text,
            style: kFontRegularGray_14,
          ),
        ),
      ],
    );
  }

  Column _widgetTitleChipsColumn(String title, List<String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: kFontRegularPrimary_14,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: SizedBox(
            height: 32,
            width: double.infinity,
            child: ListView.separated(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return WidgetChip(text: data[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 4),
            ),
          ),
        ),
      ],
    );
  }

  Row _widgetRowFunction() {
    bool _isFavorite = widget.teacherModel.isFavorite;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // WidgetFavorite(
        //   isFavorite: widget.teacherModel.isFavorite,
        //   onFavoriteChanged: (isFavorite) {
        //     Get.find<TeacherListController>().updateFavorite(isFavorite, widget.teacherModel.id);
        //   },
        // ),
        StatefulBuilder(
          builder: (context, _setState) {
            return WidgetIconTextColumn(
             iconData: _isFavorite ? Icons.favorite : Icons.favorite_border,
              text: 'Yêu thích',
              color: _isFavorite ? kRedColor : kBlueColor,
              onTap: () {
              _setState(() {
                _isFavorite = !_isFavorite;
              });
              },
            );
          }
        ),
        WidgetIconTextColumn(
          iconData: Icons.message,
          text: 'Nhắn tin',
          onTap: () {
            Navigator.pushNamed(context, AppRouter.kMessage);
          },
        ),
        WidgetIconTextColumn(
          iconData: Icons.info,
          text: 'Báo cáo',
          onTap: _showReportDialog,
        ),
      ],
    );
  }

  Row _widgetInfoHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.teacherModel.avatar),
          radius: 42,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.teacherModel.name,
              style: kFontRegularDefault_16,
            ),
            Row(
              children: [
                WidgetRatingBarIndicator(star: widget.teacherModel.star),
                SizedBox(width: 4),
                Text('(12)')
              ],
            ),
            Text(
              'Tutor',
              style: kFontRegularDefault_14,
            ),
            Text(
              widget.teacherModel.nation,
              style: kFontRegularDefault_14,
            ),
          ],
        ),
      ],
    );
  }

  void _showReportDialog() {
    showDialog<void>(
      context: _context,
      builder: (BuildContext dialogContext) {
        return ReportDialog(teacherName: widget.teacherModel.name);
      },
    );
  }

  void _showChooseDateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) {
        return const WidgetChooseDateBottomSheet();
      },
    );
  }
}
