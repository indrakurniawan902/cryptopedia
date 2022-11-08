import 'package:cryptopedia/model/coin_data/api/coin_api.dart';
import 'package:cryptopedia/model/crypto_101/api/crypto_101_all.dart';
import 'package:cryptopedia/model/crypto_101/api/crypto_101_bookmark.dart';
import 'package:cryptopedia/model/post_model/api/post_api.dart';
import 'package:cryptopedia/model/user/api/user_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'PostApi',
    () {
      test(
        'get all post sharing',
        () async {
          var result = await PostApi.getAllPost();
          expect(result.isNotEmpty, true);
        },
      );
      test(
        'get my post ',
        () async {
          String email = 'indrakurniawan902@gmail.com';
          var result = await PostApi.getMyPost(email);
          expect(result.isNotEmpty, true);
        },
      );
      test(
        'get my bookmark ',
        () async {
          String email = 'indrakurniawan902@gmail.com';
          var result = await PostApi.getMySharingBookmark(email);
          expect(result.isNotEmpty, true);
        },
      );
    },
  );
  group(
    '101 Api',
    () {
      test(
        'get all article',
        () async {
          var result = await Crypto101AllApi.get101();
          expect(result.isNotEmpty, true);
        },
      );
      test(
        'get article bookmark',
        () async {
          String email = 'indrakurniawan902@gmail.com';
          var result = await Crypto101BookmarkApi.get101Bookmark(email);
          expect(result.isNotEmpty, true);
        },
      );
    },
  );

  group(
    'Get user',
    () {
      test(
        'get current user data',
        () async {
          String email = 'indrakurniawan902@gmail.com';
          var result = await UserApi.getUserDetail(email);
          expect(result.email == email, true);
        },
      );
    },
  );

  group(
    'Coin Api',
    () {
      test(
        'get all coin',
        () async {
          var result = await CoinApi.fethData();
          expect(result.isNotEmpty, true);
        },
      );
    },
  );
}
