import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/base_api.dart';
import '../../model/teacher.dart';
import 'data/teacher_response.dart';

enum ETeacherFilter { Default, Favorite, Rating }

const fieldMap = const {
  'All': 'Tất cả',
  'english-for-kids': 'Tiếng anh cho trẻ em',
  'business-english': 'Tiếng anh cho công việc',
  'conversational-english': 'Giao tiếp',
  'starters': 'STARTERS',
  'movers': 'MOVERS',
  'flyers': 'FLYERS',
  'ket': 'KET',
  'pet': 'PET',
  'ielts': 'IELTS',
  'toefl': 'TOEFL',
  'toeic': 'Toeic',
};

class TeacherListController extends GetxController {
  ETeacherFilter teacherFilter = ETeacherFilter.Favorite;
  String specialize = '';
  String keyword = '';
  bool isLoading = false;

  List<TeacherModel> _teachers = [];

  late List<TeacherModel> displayedTeachers;

  List<TeacherModel> get favoriteTeachers =>
      _teachers.where((element) => element.isFavorite).toList() ?? [];

  TeacherListController() {
    displayedTeachers = _teachers;
  }

  Future<List<TeacherModel>> search(String key, String specialty) async {
    isLoading = true;
    update();

    List<String> specialties = <String>[];
    if (specialty.isNotEmpty) {
      specialties = [specialty];
    }
    try {
      final response = await BaseApi().post('/tutor/search', {
        'search': key,
        'page': '1',
        'perPage': 12,
        'filters': {
          'date': null,
          'tutoringTimeAvailable': [null, null],
          'specialties': specialties,
        },
      });

      final teachersResponse = TeacherListResponse.fromJson(response);

      final teachersModel = teachersResponse.teachers.map(
        (response) {
          List<String> fields = [];
          fields = response.specialties
                  ?.split(',')
                  .map((e) => fieldMap[e] ?? '')
                  .where((element) => element.isNotEmpty)
                  .toList() ??
              [];
          return TeacherModel(
            isFavorite: response.isFavorite ?? false,
            description: response.bio ?? '',
            name: response.name ?? '',
            avatar: response.avatar ?? '',
            id: response.id ?? '',
            nation: response.country ?? '',
            hobby: response.interests ?? '',
            career: '',
            education: '',
            experience: '',
            fields: fields,
            languages: response.languages != null ? response.languages!.split(',') : [],
            star: response.rating,
            userId: response.userId ?? '',
          );
        },
      ).toList();
      _teachers = teachersModel;
      displayedTeachers = _teachers;
      isLoading = false;
      update();
      return teachersModel;
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }

  Future<void> updateFavorite(bool isFavorite, String userId) async {
    try {
      final response = await BaseApi().post('/user/manageFavoriteTutor', {
        'tutorId': userId,
      });

      print('nguyentp ==> ');
      // final teachersResponse = TeacherListResponse.fromJson(response);

      // return teachersModel;
    } catch (e) {
      print('nguyentp ==> ');
    }

    final favoriteIndex = _teachers.indexWhere((element) => element.id == userId);
    if (favoriteIndex >= 0) {
      _teachers[favoriteIndex] = _teachers[favoriteIndex].copyWith(isFavorite: isFavorite);
      update();
    }
  }

  void changeFilter(ETeacherFilter filter) {
    teacherFilter = filter;
    updateTeacher();
  }

  void changeSpecialize(String specialize) {
    this.specialize = specialize;
    search('', specialize);
  }

  void changeKeyword(String keyword) {
    this.keyword = keyword.toLowerCase();
    updateTeacher();
  }

  void updateTeacher() {
    switch (teacherFilter) {
      case ETeacherFilter.Default:
        displayedTeachers = _teachers;
        break;
      case ETeacherFilter.Favorite:
        List<TeacherModel> result = [];
        result.addAll(_teachers);
        result.sort((a, b) {
          if (b.isFavorite) {
            return 1;
          } else {
            return -1;
          }
        });
        displayedTeachers = result;
        break;
      case ETeacherFilter.Rating:
        List<TeacherModel> result = [];
        result.addAll(_teachers);
        result.sort((a, b) {
          return 1;
          // return b.star.compareTo(a.star);
        });
        displayedTeachers = result;
        break;
    }

    if (specialize.isNotEmpty) {
      List<TeacherModel> result = [];
      result.addAll(displayedTeachers);
      result.removeWhere((element) => !element.fields.contains(specialize));
      displayedTeachers = result;
    }

    if (keyword.isNotEmpty) {
      List<TeacherModel> result = [];
      result.addAll(displayedTeachers);
      result.removeWhere((element) =>
          !element.name.toLowerCase().contains(keyword) &&
          !element.nation.toLowerCase().contains(keyword));
      displayedTeachers = result;
    }
    update();
  }
}
