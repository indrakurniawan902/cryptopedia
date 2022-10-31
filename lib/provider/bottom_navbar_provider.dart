import 'package:cryptopedia/screen/add_post/add_post.dart';
import 'package:cryptopedia/screen/crypto_101/crypto_101.dart';
import 'package:cryptopedia/screen/crypto_sharing/crypto_sharing.dart';
import 'package:cryptopedia/screen/homepage/homepage.dart';
import 'package:cryptopedia/screen/profile/profile.dart';
import 'package:flutter/material.dart';

class BottomNavbarProvider extends ChangeNotifier {
  int _tabIndex = 0;
  final List<Widget> _screens = [
    const Homepage(),
    const CryptoSharing(),
    const AddPost(),
    const Crypto101(),
    const Profile(),
  ];

  set currentTab(int page) {
    _tabIndex = page;
    notifyListeners();
  }

  int get currentTab => _tabIndex;

  get currentScreen => _screens[_tabIndex];
}
