import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/profile/data/user.dart';
import 'package:learning_online/features/root_controller.dart';
import 'package:learning_online/model/user.dart';

extension DateTimeEx on DateTime {
  String get toFormat {
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm');
    return format.format(this);
  }
}

class ProfileLogic extends GetxController {
  User? user;
  bool isUpdateBirthDay = false;

  Future<void> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    dio.FormData formData = dio.FormData.fromMap({
      "avatar": await dio.MultipartFile.fromFile(file.path, filename: fileName),
    });
    final responseData = await BaseApi().post('/user/uploadAvatar', formData);
    final avatar = responseData['avatar'] ?? '';
    if(avatar is String && avatar.isNotEmpty) {
     Get.find<RootController>().user = Get.find<RootController>().user?.copyWith(
       avatar: avatar
     );
    }
    print('nguyentp ==> ');
  }

  void updateBirthDay(DateTime date) {
    DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
    user = user?.copyWith(birthday: _dateFormat.format(date));
    isUpdateBirthDay = true;
    update();
  }

  Future<void> getUserInfo() async {
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/user/info',
    );

    user = UserData.fromJson(responseData).user;

    final _user = Get.find<RootController>().user;

    Get.find<RootController>().user = _user?.copyWith(
      dateOfBirth: user?.birthday ?? '',
      email: user?.email ?? '',
      id: user?.id ?? '',
      name: user?.name ?? '',
      avatar: user?.avatar ?? '',
      phoneNumber: user?.phone,
      walletInfo: user?.walletInfo,
    );

    update();
  }

  Future<void> updateUser(User updatedUser) async {
    print('nguyentp ==> ');
    final responseData = await BaseApi().put('https://sandbox.api.lettutor.com/user/info', {
      "name": updatedUser?.name ?? '',
      "country": updatedUser?.country ?? '',
      "phone": updatedUser?.phone ?? '',
      "birthday": updatedUser?.birthday ?? '',
      "level": updatedUser?.level ?? '',
      "learnTopics": updatedUser?.learnTopics?.map((e) => e.id).toList() ?? [],
      "studySchedule": updatedUser?.studySchedule ?? '',
      "testPreparations": updatedUser?.testPreparations?.map((e) => e.id).toList() ?? [],
    });

    user = UserData.fromJson(responseData).user;

    final _user = Get.find<RootController>().user;

    Get.find<RootController>().user = _user?.copyWith(
      dateOfBirth: user?.birthday ?? '',
      email: user?.email ?? '',
      id: user?.id ?? '',
      name: user?.name ?? '',
      avatar: user?.avatar ?? '',
      phoneNumber: user?.phone,
      walletInfo: user?.walletInfo,
    );

    update();
  }
}
