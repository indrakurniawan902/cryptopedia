import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
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
        appBar: DefaultAppbar(
          size: 79.h,
          title: 'My Post',
          fontSize: 32,
          isBack: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const FormFieldComponent(
                isDisable: false,
                isSearchBar: true,
                placeholder: 'Search',
                name: '',
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) => const PostCard(
                  isBookmark: true,
                  isPost: true,
                  category: 'YEY',
                  postTitle: 'postTitle',
                  postBody: 'da',
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
