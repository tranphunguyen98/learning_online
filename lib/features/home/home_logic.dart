import 'package:get/get.dart';
import 'package:learning_online/core/base_api.dart';
import 'package:learning_online/features/home/data/total.dart';

class HomeLogic extends GetxController {
  Total? total;

  Future<void> getTotal() async {
    final responseData = await BaseApi().get(
      'https://sandbox.api.lettutor.com/call/total',
    );

    total = Total.fromJson(responseData);

    update();
  }

}
