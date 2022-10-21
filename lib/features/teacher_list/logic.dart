import 'package:get/get.dart';

import 'package:get/get.dart';
import '../../model/teacher.dart';

enum ETeacherFilter { Default, Favorite, Rating }

class TeacherListController extends GetxController {
  ETeacherFilter teacherFilter = ETeacherFilter.Favorite;

  List<TeacherModel> _teachers = [
    TeacherModel.mock,
    TeacherModel.mock1,
    TeacherModel.mock,
    TeacherModel.mock1,
    TeacherModel.mock,
    TeacherModel.mock1,
    TeacherModel.mock,
    TeacherModel.mock1,
  ];

  late List<TeacherModel> displayedTeachers;

  TeacherListController() {
    displayedTeachers = _teachers;
  }

  void changeFilter(ETeacherFilter filter) {
    teacherFilter = filter;
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
    update();
  }
}
