import 'package:cryptopedia/model/crypto_101/api/bookmark_api.dart';
import 'package:cryptopedia/model/crypto_101/api/crypto_101_all.dart';
import 'package:cryptopedia/model/crypto_101/api/crypto_101_bookmark.dart';
import 'package:cryptopedia/model/crypto_101/crypto_101_model.dart';
import 'package:cryptopedia/model/user/api/user_api.dart';
import 'package:cryptopedia/model/user/user_model.dart';
import 'package:flutter/cupertino.dart';

class Crypto101Provider extends ChangeNotifier {
  List<Crypto101Model> _crypto101 = [];
  bool _isLoading = true;
  bool _isBookmark = false;

  List get articles => _crypto101;
  bool get loading => _isLoading;
  bool get bookmark => _isBookmark;

  get101Data() async {
    _isLoading = true;
    final result = await Crypto101AllApi.get101();
    _crypto101 = result;
    _isLoading = false;
    notifyListeners();
  }

  get101BookmarkData(String email) async {
    _isLoading = true;
    final result = await Crypto101BookmarkApi.get101Bookmark(email);
    _crypto101 = result;
    _isLoading = false;
    notifyListeners();
  }

  void search101(String keyword) async {
    notifyListeners();
    _isLoading = true;
    final result = await Crypto101AllApi.search101(keyword.toLowerCase());
    _crypto101 = result;
    _isLoading = false;
  }

  void search101Bookmark(String email, String keyword) async {
    notifyListeners();
    _isLoading = true;
    final result = await Crypto101BookmarkApi.get101Bookmark(email);
    final filteredArticles = result.where((article) {
      final articleTitle = article.title.toLowerCase();
      final articleBody = article.body.toLowerCase();
      final input = keyword.toLowerCase();
      return articleTitle.contains(input) || articleBody.contains(input);
    }).toList();

    _crypto101 = filteredArticles;
    _isLoading = false;
  }
}
