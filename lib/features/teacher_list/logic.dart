import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/base_api.dart';
import '../../model/teacher.dart';
import 'data/teacher_response.dart';

enum ETeacherFilter { Default, Favorite, Rating }

final nationalMap = {
  'isVietNamese': 'Gia Sư Việt Nam'.tr,
  'isForeigner': 'Gia Sư Nước Ngoài'.tr,
  'isNative': 'Gia Sư Tiếng Anh Bản Ngữ'.tr
};

final fieldMap = {
  'All': 'Tất cả'.tr,
  'english-for-kids': 'Tiếng anh cho trẻ em'.tr,
  'business-english': 'Tiếng anh cho công việc'.tr,
  'conversational-english': 'Giao tiếp'.tr,
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
  List<String> nationals = [];
  String keyword = '';
  int currentPage = 1;
  bool isFishLoadMore = false;
  bool isLoading = false;

  List<TeacherModel> _teachers = [];

  late List<TeacherModel> displayedTeachers;

  List<TeacherModel> get favoriteTeachers =>
      _teachers.where((element) => element.isFavorite).toList();

  TeacherListController() {
    displayedTeachers = _teachers;
  }

  Future<bool> search([bool isLoadMore = false]) async {
    if(isLoadMore) {
      currentPage += 1;
    } else {
      currentPage = 1;
      isFishLoadMore = false;
      isLoading = true;
    }
    update();

    List<String> specialties = <String>[];
    if (specialize.isNotEmpty) {
      specialties = [specialize];
    }

    var nationality = <String, dynamic>{};
    if(nationals.isNotEmpty && nationals.length <= 2) {
      if(nationals.length == 1) {
        if(nationals.contains('isForeigner')) {
          print('nguyentp ==> ');
          nationality = {
            'isVietNamese': false,
            'isNative': false,
          };
        } else if(nationals.contains('isVietNamese')) {
          nationality = {
            'isVietNamese': true,
          };
        } else if(nationals.contains('isNative')) {
          nationality = {
            'isNative': true,
          };
        }
      } else {
        print('nguyentp ==> ');
        if(!nationals.contains('isVietNamese')) {
          nationality = {
            'isVietNamese': false,
          };
        } else if(!nationals.contains('isNative')) {
          nationality = {
            'isNative': false,
          };
        } else if(!nationals.contains('isForeigner')) {
          nationality = {
            'isVietNamese': true,
            'isNative': true,
          };
        }
      }
      print('nguyentp ==> ');
    }
    print('nguyentp page ==> ${currentPage}');
    try {
      final response = await BaseApi().post('/tutor/search', {
        'search': keyword,
        'page': '$currentPage',
        'perPage': 12,
        'filters': {
          'date': null,
          'nationality': nationality,
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
            experience: response.experience ?? '',
            fields: fields,
            languages: response.languages != null ? response.languages!.split(',') : [],
            star: response.rating,
            userId: response.userId ?? '',
            video: response.video ?? '',
          );
        },
      ).toList();
      if(isLoadMore) {
        if(teachersModel.isEmpty) {
          isFishLoadMore = true;
        } else {
          _teachers.addAll(teachersModel);
        }
      } else {
        _teachers = teachersModel;
      }

      displayedTeachers = _teachers;
      isLoading = false;
      update();
      return true;
    } catch (e) {
      isLoading = false;
      update();
      return false;
    }
  }

  Future<void> updateFavorite(bool isFavorite, String userId) async {
    try {
       await BaseApi().post('/user/manageFavoriteTutor', {
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
    search();
  }

  void changeFilter(ETeacherFilter filter) {
    teacherFilter = filter;
    updateTeacher();
  }

  void changeSpecialize(String specialize) {
    this.specialize = specialize;
    search();
  }

  void changeNational(List<String> nationals) {
    this.nationals = nationals;
    search();
  }

  void changeKeyword(String keyword) {
    this.keyword = keyword.toLowerCase();
    search();
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
