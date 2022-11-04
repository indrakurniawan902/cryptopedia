import 'dart:convert';

import 'package:cryptopedia/model/crypto_101/crypto_101_model.dart';
import 'package:cryptopedia/model/user/user_model.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:dio/dio.dart';

class Crypto101AllApi {
  static Future<List<Crypto101Model>> get101() async {
    try {
      final response =
          await Dio().get('${ApiConstants.baseUrl}${ApiConstants.get101}');

      if (response.statusCode == 200) {
        List<Crypto101Model> articles = (response.data as List)
            .map((e) => Crypto101Model(
                id: e['_id'],
                title: e['article_title'],
                body: e['article_body'],
                userBookmarked: e['user_bookmarked']))
            .toList();

        print(articles);
        return articles;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
