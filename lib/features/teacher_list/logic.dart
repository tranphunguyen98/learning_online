import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/teacher.dart';


enum ETeacherFilter { Default, Favorite, Rating }

class TeacherListController extends GetxController {
  ETeacherFilter teacherFilter = ETeacherFilter.Favorite;
  String specialize = '';
  String keyword = '';

  final List<TeacherModel> _teachers = [
    TeacherModel.mock,
    TeacherModel.mock1,
    TeacherModel.mock2,
    TeacherModel.mock1,
    TeacherModel.mock,
    TeacherModel.mock1,
    TeacherModel.mock2,
    TeacherModel.mock1,
  ];

  late List<TeacherModel> displayedTeachers;

  List<TeacherModel> get favoriteTeachers => _teachers.where((element) => element.isFavorite).toList() ?? [];

  TeacherListController() {
    displayedTeachers = _teachers;
  }

  void updateFavorite(bool isFavorite, int id) {
    final favoriteIndex = _teachers.indexWhere((element) => element.id == id);
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
    updateTeacher();
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
          return b.star.compareTo(a.star);
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
      !element.name.toLowerCase().contains(keyword) && !element.nation.toLowerCase().contains(keyword));
      displayedTeachers = result;
    }
    update();
  }
}
