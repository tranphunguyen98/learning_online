import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/core/core.dart';
import 'package:learning_online/core/widgets/widget_chip.dart';
import 'package:learning_online/core/widgets/widget_icon_text_column.dart';
import 'package:learning_online/core/widgets/widget_rating_bar_indicator.dart';
import 'package:learning_online/core/widgets/widget_video_player.dart';
import 'package:learning_online/features/teacher_detail/teacher_detail_logic.dart';
import 'package:learning_online/features/teacher_detail/widgets/report_dialog.dart';
import 'package:learning_online/features/teacher_detail/widgets/review_tutor_list.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_choose_date_bottom_sheet.dart';
import 'package:learning_online/features/teacher_detail/widgets/widget_schedule.dart';
import 'package:learning_online/model/teacher.dart';
import 'package:learning_online/utils/data.dart';
import 'package:learning_online/utils/nation_data.dart';

import '../../../utils/router.dart';

class TeacherDetailPage extends StatefulWidget {
  final String teacherId;

  const TeacherDetailPage({Key? key, required this.teacherId}) : super(key: key);

  @override
  _TeacherDetailPageState createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends State<TeacherDetailPage> {
  late BuildContext _context;
  late TeacherModel teacherModel;

  // late Future getNations;
  // Map<String, dynamic> nationalData = {};
  List<String> languageNames = [];
  TeachDetailLogic controller = Get.put<TeachDetailLogic>(TeachDetailLogic());

  @override
  void initState() {
    controller.getTeacher(widget.teacherId);
    controller.getReview(widget.teacherId);
    // getNations = BaseApi().getNations(teacherModel.nation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<TeachDetailLogic>(
          init: controller,
          builder: (logic) {
            if (logic.teacherModel != null) {
              teacherModel = logic.teacherModel!;
              languageNames = teacherModel.languages.map((la) {
                final languageData = languages.firstWhereOrNull((e) => e['code'] == la);
                return languageData?['name'] ?? la;
              }).toList();
              return _buildBody();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetVideoPlayer(
            video: teacherModel.video,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _widgetInfoHeader(),
                const SizedBox(height: 16),
                Text(
                  teacherModel.description,
                  style: kFontRegularDefault_14,
                ),
                const SizedBox(height: 16),
                _widgetRowFunction(),
                const SizedBox(height: 8),
                _widgetTitleChipsColumn('Ngôn ngữ', languageNames),
                _widgetTitleChipsColumn('Chuyên ngành', teacherModel.fields),
                _widgetTitleTextColumn('Sở thích', teacherModel.hobby),
                _widgetTitleTextColumn('Kinh nghiêm', teacherModel.experience),
                // _widgetTitleTextColumn('Học vấn', teacherModel.education),
                // _widgetTitleTextColumn('Nghề nghiệp', teacherModel.career),
                const SizedBox(height: 16),
                const WidgetSchedule(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
            child: _widgetViewReview(),
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
          'Đánh giá và bình luận (${controller.totalReview})',
          style: kFontRegularPrimary_14,
        ),
        const SizedBox(height: 16),
        WidgetReviewTutorList(
          reviewTutors: controller.reviews,
        ),
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
          padding: const EdgeInsets.only(top: 4.0),
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
          padding: const EdgeInsets.only(top: 8.0, right: 8),
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
    bool _isFavorite = teacherModel.isFavorite;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // WidgetFavorite(
        //   isFavorite: teacherModel.isFavorite,
        //   onFavoriteChanged: (isFavorite) {
        //     Get.find<TeacherListController>().updateFavorite(isFavorite, teacherModel.id);
        //   },
        // ),
        StatefulBuilder(builder: (context, _setState) {
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
        }),
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
    // BaseApi().getLanguageName('');
    Map<String, dynamic>? nationalData =
        nations.firstWhereOrNull((element) => element['code'] == teacherModel.nation);
    final nameData = nationalData?['name'] ?? '';
    String name = '';
    if (nameData is String) {
      name = nameData;
    }
    String flag = nationalData?['flag'] ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(teacherModel.avatar),
          radius: 42,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teacherModel.name,
              style: kFontRegularDefault_16,
            ),
            Row(
              children: [
                WidgetRatingBarIndicator(star: teacherModel.star),
                SizedBox(width: 4),
                Text(teacherModel.totalFeedback > 0 ? '(${teacherModel.totalFeedback})' : ''),
              ],
            ),
            Text(
              'Tutor',
              style: kFontRegularDefault_14,
            ),
            Row(
              children: [
                CachedNetworkImage(
                  imageUrl: flag,
                  height: 24,
                  width: 24,
                ),
                SizedBox(width: 4),
                Text(
                  name,
                  style: kFontRegularDefault_14,
                ),
              ],
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
        return ReportDialog(teacherName: teacherModel.name);
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
