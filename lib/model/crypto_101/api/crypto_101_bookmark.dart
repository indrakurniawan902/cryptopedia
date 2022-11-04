import 'dart:convert';

import 'package:cryptopedia/model/user/user_model.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:dio/dio.dart';

class Crypto101BookmarkApi {
  static Future<List> get101Bookmark(String email) async {
    try {
      final response = await Dio().get(
          '${ApiConstants.baseUrl}${ApiConstants.get101Bookmark}?email=$email');
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
