import 'package:cryptopedia/model/crypto_101/api/crypto_101_all.dart';
import 'package:cryptopedia/model/crypto_101/api/crypto_101_bookmark.dart';
import 'package:cryptopedia/model/crypto_101/crypto_101_model.dart';
import 'package:cryptopedia/model/user/api/user_api.dart';
import 'package:cryptopedia/model/user/user_model.dart';
import 'package:flutter/cupertino.dart';

class Crypto101Provider extends ChangeNotifier {
  List<Crypto101Model> _crypto101 = [];
  // List _crypto101 = [];

  List get articles => _crypto101;

  get101Data() async {
    final result = await Crypto101AllApi.get101();
    _crypto101 = result;
    notifyListeners();
  }

  get101BookmarkData(String email) async {
    final result = await Crypto101BookmarkApi.get101Bookmark(email);
    _crypto101 = result;
    notifyListeners();
  }
}
