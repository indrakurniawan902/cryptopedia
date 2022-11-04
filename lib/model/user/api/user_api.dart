import 'package:cryptopedia/model/user/user_model.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UserApi {
  static Future<UserModel> getUserDetail(String email) async {
    try {
      final response = await Dio()
          .get('${ApiConstants.baseUrl}${ApiConstants.getUser}?email=$email');
      if (response.statusCode == 200) {
        return UserModel(
            createdPost: response.data['created_posts'],
            id: response.data['_id'],
            username: response.data['username'],
            email: response.data['email'],
            name: response.data['name']);
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<UserModel> putUserDetail(
      String email, String name, String username) async {
    try {
      final response = await Dio()
          .put('${ApiConstants.baseUrl}${ApiConstants.editProfile}', data: {
        "email": email,
        "username": username,
        "name": name,
      });
      if (response.statusCode == 200) {
        return UserModel(
            username: response.data['username'],
            email: response.data['email'],
            name: response.data['name']);
      } else {
        throw Exception('Failed to save Data');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
