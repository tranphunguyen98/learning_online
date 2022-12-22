import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/profile/data/user.dart';

extension DateTimeEx on DateTime {
  String get toFormat {
    DateFormat format = DateFormat('dd/MM/yyyy HH:mm');
    return format.format(this);
  }
}

class ProfileLogic extends GetxController {
  User? user;


  void updateBirthDay(DateTime date) {
    DateFormat _dateFormat = DateFormat('yyyy-MM-dd');
    user = user?.copyWith(birthday: _dateFormat.format(date));
    update();
  }
  Future<void> getUserInfo() async {
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/user/info',
    );

    user = UserData.fromJson(responseData).user;

    update();
  }

}
