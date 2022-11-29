import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/server_failure.dart';

import '../features/root_controller.dart';

class BaseApi {
  static final BaseApi _singleton = BaseApi._internal();

  factory BaseApi() {
    return _singleton;
  }

  BaseApi._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://sandbox.api.lettutor.com',
      headers: {
        "Content-Type": "application/json",
        "Authorization": 'Bearer ${Get.find<RootController>().user?.accessToken ?? ''}'
      },
    ),
  );

  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data) async {
    try {
      final user = Get.find<RootController>().user;
      final auth = 'Bearer ${user?.accessToken ?? ''}';
      _dio.options.headers['Authorization'] = auth;
      final response = await _dio.post(path, data: data);
      final dataReponse = response.data as Map<String, dynamic>;
      print('nguyentp ==> $dataReponse');
      if (dataReponse.isEmpty) {
        throw ServerFailure();
      } else {
        return dataReponse;
      }
    } on DioError catch (e) {
      final response = (e.response?.data ?? {}) as Map<String, dynamic>;
      throw ServerFailure(response['message']);
    } catch (e) {
      throw ServerFailure();
    }
  }
}
