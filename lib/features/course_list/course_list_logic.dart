import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/course_list/data/category.dart';
import 'package:learning_online/features/course_list/data/course.dart';
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

class CourseListLogic extends GetxController {
  List<Category> categories = [];
  String _keyword = '';
  bool loading = false;

  void search(String keyword) {
    _keyword = keyword;
    getCourses();
  }

  Future<void> getCourses() async {
    loading = true;
    var courses = <Course>[];

    List<Future> futures = [];

    futures.add(
        BaseApi().get(
          '/content-category',
        ).then((value) {
          categories =
          (value['rows'] as List).map((e) => Category.fromJson(e)).toList();
        }),
    );

    futures.add(
      BaseApi().get(
        '/course?page=1&size=100&q=$_keyword',
      ).then((value) {
        courses =
            (value['data']['rows'] as List).map((e) => Course.fromJson(e)).toList();
      }),
    );

    await Future.wait(futures);

    for (var category in categories) {
      final coursesInCate = courses.where((element) {
        if(element.categories?.isNotEmpty ?? false) {
         return element.categories!.first.id == category.id;
        }
        return false;
      }).toList();
      category.courses = coursesInCate;
    }
    
    categories.removeWhere((element) => element.courses?.isEmpty ?? true);

    loading = false;
    update();
  }

}
