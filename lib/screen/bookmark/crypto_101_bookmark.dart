import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:flutter/material.dart';

class Crypto101Bookmark extends StatefulWidget {
  const Crypto101Bookmark({super.key});

  @override
  State<Crypto101Bookmark> createState() => _Crypto101BookmarkState();
}

class _Crypto101BookmarkState extends State<Crypto101Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10),
            child: PostCard(
              postTitle: 'asdasdasdasdasdsad',
              category: 'Bitcoin',
              isBookmark: true,
              isPost: true,
              postBody: 'asdasdasdasdsad',
              username: 'USername',
            )),
      ),
    );
  }
}
