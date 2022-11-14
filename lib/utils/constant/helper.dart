import 'package:cryptopedia/screen/bookmark/bookmark_crypto_101.dart';
import 'package:cryptopedia/screen/bookmark/bookmark_crypto_sharing.dart';
import 'package:cryptopedia/screen/crypto_101/crypto_101_bookmark.dart';
import 'package:cryptopedia/screen/crypto_sharing/crypto_sharing_all.dart';
import 'package:cryptopedia/screen/crypto_sharing/crypto_sharing_bookmark.dart';
import 'package:flutter/material.dart';

import '../../screen/crypto_101/crypto_101_all.dart';

class Helper {
  static List<Tab> tabs = const [
    Tab(text: "Crypto Sharing"),
    Tab(text: "Crypto 101"),
  ];

  static List<Tab> tabsPost = const [
    Tab(text: "ALL"),
    Tab(text: "BOOKMARK"),
  ];

  static List<Widget> tabViewBookmark = [
    const BookmarkCryptoSharing(),
    const BookmarkCrypto101(),
  ];

  static List<Widget> tabViewSharing = [
    const CryptoSharingAll(),
    const CryptoSharingBookmark(),
  ];

  static List<Widget> tabView101 = [
    const Crypto101All(),
    const Crypto101Bookmark(),
  ];
}
