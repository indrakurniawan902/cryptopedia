import 'package:cryptopedia/screen/components/post_appbar.dart';
import 'package:cryptopedia/utils/constant/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class MyPost extends StatefulWidget {
  const MyPost({super.key});

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(
          child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(124),
            child: PostAppbar(size: 124.h, isContent: false, title: 'My Post')),
        body: TabBarView(children: Helper.tabViewMyPost),
      )),
    );
  }
}
