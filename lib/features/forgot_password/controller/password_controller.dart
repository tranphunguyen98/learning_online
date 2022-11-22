import 'package:get/get.dart';

import '../../../core/base_api.dart';

class ForgotPasswordController extends GetxController {
  bool isLoading = false;

  Future<String> forgotPassword(String email) async {
    isLoading = true;
    update();

    try {
      final response = await BaseApi().post('/user/forgotPassword', {
        'email': email,
      });
      isLoading = false;
      update();
      return response['message'] ?? 'Gửi email reset mật khẩu thành công!';
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }
}
