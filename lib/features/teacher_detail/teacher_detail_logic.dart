import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/teacher_detail/data/review.dart';
import 'package:learning_online/features/teacher_list/data/teacher_response.dart';
import 'package:learning_online/features/teacher_list/logic.dart';
import 'package:learning_online/model/review_tutor.dart';
import 'package:learning_online/model/teacher.dart';

extension DateTimeEx on DateTime {
  String get toFormat {
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm');
    return format.format(this);
  }
}

class TeachDetailLogic extends GetxController {
  TeacherModel? teacherModel;
  int totalReview = 0;
  List<ReviewTutorModel> reviews = [];

  Future<void> getTeacher(String id) async {
    final responseData = await BaseApi().get(
      '/tutor/$id',
    );
    final response = TeacherResponse.fromJson(responseData);

    List<String> fields = [];
    fields = response.specialties
            ?.split(',')
            .map((e) => fieldMap[e] ?? '')
            .where((element) => element.isNotEmpty)
            .toList() ??
        [];

    final userData = responseData['User'];

    teacherModel = TeacherModel(
      isFavorite: responseData['isFavorite'] ?? false,
      description: response.bio ?? '',
      name: userData['name'] ?? '',
      avatar: userData['avatar'] ?? '',
      id: response.id ?? '',
      nation: userData['country'] ?? '',
      hobby: response.interests ?? '',
      career: '',
      education: '',
      experience: response.experience ?? '',
      fields: fields,
      languages: response.languages != null ? response.languages!.split(',') : [],
      star: response.rating,
      userId: response.userId ?? '',
      video: response.video ?? '',
      totalFeedback: responseData['totalFeedback'] ?? 0,
    );

    update();
  }

  Future<void> getReview(String id) async {
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/feedback/v2/$id?page=1&perPage=12',
    );

    totalReview = responseData['data']['count'] ?? 0;

    final responses =
        (responseData['data']['rows'] as List).map((e) => Review.fromJson(e)).toList();

    reviews = responses.map((e) {
      return ReviewTutorModel(
        imageUrl: e.firstInfo?.avatar ?? '',
        name: e.firstInfo?.name ?? '',
        comment: e.content ?? '',
        date: DateTime.parse(e.createdAt ?? '').toFormat,
        star: e.rating?.toDouble() ?? 0.0,
      );
    }).toList();

    print('nguyentp ==> ');
    update();
  }
}
