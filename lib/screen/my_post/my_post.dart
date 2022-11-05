import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            body: Consumer<PostProvider>(
              builder: (context, value, child) => value.myPostSharing.isEmpty
                  ? Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/no_post.png',
                                height: 120.h,
                                width: 158.w,
                              ),
                              // SizedBox(height: 5.h),
                              Text(
                                'You don’t have post yet',
                                style: noPost,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
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
                          SizedBox(
                            height: 10.h,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.myPostSharing.length,
                            itemBuilder: (context, index) => PostCard(
                              isBookmark: true,
                              isPost: true,
                              category: value.myPostSharing[index].category!,
                              postTitle: value.myPostSharing[index].postTitle!,
                              postBody: value.myPostSharing[index].postBody!,
                              dislike: value.myPostSharing[index].dislike!
                                  .toString(),
                              like: value.myPostSharing[index].like!.toString(),
                              username: value.myPostSharing[index].username!,
                            ),
                          ),
                        ],
                      ),
                    ),
            )),
      ),
    );
  }
}
