import 'dart:convert';

import 'package:cryptopedia/model/user/user_model.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:dio/dio.dart';

class Crypto101AllApi {
  static Future<List> get101() async {
    try {
      final response =
          await Dio().get('${ApiConstants.baseUrl}${ApiConstants.get101}');
      if (response.statusCode == 200) {
        var dataResponse = jsonDecode(response.data) as List;
        return dataResponse;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
