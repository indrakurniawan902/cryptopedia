import 'package:cryptopedia/provider/auth_provider.dart';
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
                            itemBuilder: (context, index) {
                              List<String> userBookmarked = List<String>.from(
                                  value.allSharing[index].userBookmarked
                                      as List);
                              return InkWell(
                                splashColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/sharing-detail",
                                      arguments: {
                                        'index': index,
                                        'id': value.allSharing[index].id,
                                        'title':
                                            value.allSharing[index].postTitle,
                                        'body':
                                            value.allSharing[index].postBody,
                                        'like': value.allSharing[index].like,
                                        'dislike':
                                            value.allSharing[index].dislike,
                                        'category':
                                            value.allSharing[index].category,
                                        'comment':
                                            value.allSharing[index].comment,
                                        'tag': value.allSharing[index].tags,
                                        'username':
                                            value.allSharing[index].username,
                                        'userBookmarked': userBookmarked,
                                      });
                                },
                                child: Consumer<AuthProvider>(
                                  builder: (context, user, child) => PostCard(
                                    comment: value.allSharing[index].comment,
                                    tag: value.allSharing[index].tags,
                                    isBookmark: userBookmarked
                                        .contains(user.getUser()!.email),
                                    isPost: true,
                                    category: value.allSharing[index].category!,
                                    postTitle:
                                        value.allSharing[index].postTitle!,
                                    postBody: value.allSharing[index].postBody,
                                    dislike: value.allSharing[index].dislike
                                        .toString(),
                                    like:
                                        value.allSharing[index].like.toString(),
                                    username: value.allSharing[index].username,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
            )),
      ),
    );
  }
}
