import 'dart:convert';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:http/http.dart' as http;

class Crypto101AddBookmarkApi {
  static Future addBookmark(String email, String id) async {
    try {
      print(email);

      Map data = {'email': email};

      final response = await http.post(
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.bookmark101}/$id'),
          headers: {"Content-Type": "application/json"},
          body: json.encode(data));

      if (response.statusCode == 200) {
        return "success";
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
