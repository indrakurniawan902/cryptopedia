import 'package:cryptopedia/screen/components/post_appbar.dart';
import 'package:cryptopedia/utils/constant/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PostAppbar(size: 124.h, isContent: false, title: 'Bookmark'),
        body: TabBarView(children: Helper.tabViewBookmark),
      ),
    ));
  }
}
