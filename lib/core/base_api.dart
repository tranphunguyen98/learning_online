import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:learning_online/core/server_failure.dart';
import 'package:learning_online/utils/nation_data.dart';

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


  Future<Map<String, dynamic>> get(String path) async {
    try {
      final user = Get.find<RootController>().user;
      final auth = 'Bearer ${user?.accessToken ?? ''}';
      _dio.options.headers['Authorization'] = auth;
      final response = await _dio.get(path);
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

// String getLanguageName(String code) {
//   // final nationalData = nationalDataList.firstWhere((element) {
//   //   final languages = element['languages'];
//   //   if(languages is List<Map<String, dynamic>>) {
//   //     if(languages.indexWhere((element) => element['iso639_1'] == code ) >= 0) {
//   //       return true;
//   //     }
//   //   }
//   //   return false;
//   // });
//
//   var languages = [];
//
//   final nation = nationalDataList.map((e) {
//     languages.addAll(e['languages'] as List<Map<String, dynamic>>);
//     final lan = e['languages'];
//     if(lan is List) {
//       languages.addAll(lan);
//     }
//     final resultMap = {};
//     resultMap['code'] = e['alpha2Code'];
//     resultMap['name'] = e['name'];
//     final flags = e['flags'];
//     String flag = '';
//     if(flags is Map<String, dynamic>) {
//       flag = flags['png'] ?? '';
//     }
//     resultMap['flag'] = flag;
//     return resultMap;
//   }).toList();
//
//   final a = jsonEncode(nation);
//   final l = languages.toSet().toList();
//
//   final x = [];
//   for(var a in l) {
//     final isA = x.indexWhere((element) => element['iso639_1'] == a['iso639_1']) < 0;
//     print('nguyentp ==> ');
//     if(isA) {
//       x.add(a);
//     }
//   }
//
//   final b = jsonEncode(x);
//
//   return '';
// }

// Future<Map<String, dynamic>> getNations(String nameCode) async {
//   final Dio _nationalDio = Dio(
//     BaseOptions(
//       baseUrl: 'https://restcountries.com/v3.1/alpha/$nameCode',
//       headers: {
//         "Content-Type": "application/json",
//       },
//     ),
//   );
//
//   try {
//     final response = await _nationalDio.get('');
//
//     final dataReponse = response.data as List<dynamic>;
//     if(dataReponse.isNotEmpty) {
//       return dataReponse.first as Map<String, dynamic>;
//     }
//   } catch(e) {
//     print('nguyentp ==> $e');
//   }
//   return {};
// }
}
