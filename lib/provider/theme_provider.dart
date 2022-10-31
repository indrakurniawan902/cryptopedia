import 'package:cryptopedia/utils/constant/shared_pref_theme.dart';
import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  bool get themeValue => _isDarkTheme;
  SharedPrefTheme changeTheme = SharedPrefTheme();

  set themeValue(bool value) {
    changeTheme.setDarkTheme(value);
    _isDarkTheme = value;
    notifyListeners();
  }

  // toogleTheme() {
  //   _isDarkTheme = !_isDarkTheme;
  //   notifyListeners();
  // }

  getPrefTheme() async {
    _isDarkTheme = await changeTheme.getTheme();
    notifyListeners();
  }
}
