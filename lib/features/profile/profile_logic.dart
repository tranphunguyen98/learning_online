import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/course_list/data/category.dart';
import 'package:learning_online/features/course_list/data/course.dart';
import 'package:learning_online/features/profile/data/user.dart';
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

class ProfileLogic extends GetxController {
  User? user;

  Future<void> getCourses() async {
    var courses = <Course>[];

    // BaseApi().get(
    //   '/content-category',
    // ).then((value) {
    // }),

    // futures.add(
    // BaseApi().get(
    //     '/course?page=1&size=100&q=$keyword',
    //   ).then((value) {
    //     courses =
    //         (value['data']['rows'] as List).map((e) => Course.fromJson(e)).toList();
    //   }),
    // );

    // await Future.wait(futures);

    // for (var category in categories) {
    //   final coursesInCate = courses.where((element) {
    //     if(element.categories?.isNotEmpty ?? false) {
    //      return element.categories!.first.id == category.id;
    //     }
    //     return false;
    //   }).toList();
    //   category.courses = coursesInCate;
    // }
    //
    // categories.removeWhere((element) => element.courses?.isEmpty ?? true);

    update();
  }

}
