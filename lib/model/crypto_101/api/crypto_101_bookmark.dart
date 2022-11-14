import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:dio/dio.dart';

import '../crypto_101_model.dart';

class Crypto101BookmarkApi {
  static Future<List<Crypto101Model>> get101Bookmark(String email) async {
    try {
      final response = await Dio().get(
          '${ApiConstants.baseUrl}${ApiConstants.get101Bookmark}?email=$email');
      if (response.statusCode == 200) {
        List<Crypto101Model> articles = (response.data as List)
            .map((e) => Crypto101Model(
                id: e['_id'],
                title: e['article_title'],
                body: e['article_body'],
                userBookmarked: e['user_bookmarked']))
            .toList();

        return articles;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
