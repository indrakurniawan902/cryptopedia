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

  changeBookmarkStatus(String email, String id, bool statusBookmark) async {
    _isLoading = true;
    await Crypto101AddBookmarkApi.addBookmark(email, id);
    statusBookmark = !statusBookmark;
    _isLoading = false;
    notifyListeners();
  }

  getValueBookmark(String email) async {
    final result = await Crypto101BookmarkApi.get101Bookmark(email);
    if (result.contains(email)) {
      _isBookmark = !_isBookmark;
    }
    notifyListeners();
  }
}
