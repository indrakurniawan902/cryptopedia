import 'package:cryptopedia/model/user/api/user_api.dart';
import 'package:cryptopedia/model/user/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user =
      UserModel(username: '', email: '', name: '', id: '', createdPost: []);

  UserModel get users => _user;

  getUserData(String email) async {
    final result = await UserApi.getUserDetail(email);
    _user = result;
    notifyListeners();
  }

  updateUserData(String email, String name, String username) async {
    final result = await UserApi.putUserDetail(email, name, username);
    _user = result;
    notifyListeners();
  }
}
