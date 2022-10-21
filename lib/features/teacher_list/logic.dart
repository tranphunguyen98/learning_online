import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../model/teacher.dart';

enum ETeacherFilter { Default, Favorite, Rating }

class TeacherListController extends GetxController {
  ETeacherFilter teacherFilter = ETeacherFilter.Favorite;
  String specialize = '';

  List<TeacherModel> _teachers = [
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

  TeacherListController() {
    displayedTeachers = _teachers;
  }

  void changeFilter(ETeacherFilter filter) {
    teacherFilter = filter;
    updateTeacher();
  }

  void changeSpecialize(String specialize) {
    this.specialize = specialize;
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

    update();
  }
}
