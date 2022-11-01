import 'package:cryptopedia/screen/bookmark/crypto_101_bookmark.dart';
import 'package:cryptopedia/screen/bookmark/crypto_sharing_bookmark.dart';
import 'package:cryptopedia/screen/crypto_sharing/crypto_sharing.dart';
import 'package:cryptopedia/screen/my_post/crypto_101_mypost.dart';
import 'package:cryptopedia/screen/my_post/crypto_sharing_mypost.dart';
import 'package:flutter/material.dart';

class Helper {
  static List<Tab> tabs = const [
    Tab(text: "Crypto Sharing"),
    Tab(text: "Crypto 101"),
  ];

  static List<Tab> tabsPost = const [
    Tab(text: "All"),
    Tab(text: "Bookmark"),
  ];

  static List<Widget> tabViewBookmark = [
    const CryptoSharingBookmark(),
    const Crypto101Bookmark(),
  ];

  static List<Widget> tabViewMyPost = [
    const CryptoSharingMyPost(),
    const Crypto101MyPost(),
  ];
}
