import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/teacher_list/data/teacher_response.dart';
import 'package:learning_online/features/teacher_list/logic.dart';
import 'package:learning_online/model/teacher.dart';

class TeachDetailLogic extends GetxController {
  TeacherModel? teacherModel;

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
}
