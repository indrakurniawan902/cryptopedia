import 'package:cryptopedia/screen/bookmark/bookmark_crypto_101.dart';
import 'package:cryptopedia/screen/bookmark/bookmark_crypto_sharing.dart';
import 'package:cryptopedia/screen/crypto_sharing/crypto_sharing.dart';
import 'package:cryptopedia/screen/crypto_sharing/crypto_sharing_all.dart';
import 'package:cryptopedia/screen/crypto_sharing/crypto_sharing_bookmark.dart';
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
    const BookmarkCryptoSharing(),
    const BookmarkCrypto101(),
  ];

  static List<Widget> tabViewSharing = [
    const CryptoSharingAll(),
    const CryptoSharingBookmark(),
  ];
}
