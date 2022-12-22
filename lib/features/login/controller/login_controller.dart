import 'package:get/get.dart';
import 'package:learning_online/features/login/data/login_reponse.dart';

import '../../../core/base_api.dart';
import '../../../model/user.dart';
import '../../root_controller.dart';

class LoginController extends GetxController {
  bool isLoading = false;

  Future<UserModel> login(String email, String password) async {
    isLoading = true;
    update();

    try {
      final response = await BaseApi().post('/auth/login', {
        'email': email,
        'password': password,
      });

      final registerResponse = LoginResponse.fromJson(response);
      final user = registerResponse.user;
      final token = registerResponse.tokens;

      final userModel = UserModel(
        dateOfBirth: user?.birthday ?? '',
        email: user?.email ?? '',
        id: user?.id ?? '',
        name: user?.name ?? '',
        avatar: user?.avatar ?? '',
        accessToken: token?.access?.token ?? '',
        phoneNumber: user?.phone,
      );

      Get.find<RootController>().user = userModel;

      return userModel;
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }
}
