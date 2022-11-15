import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/post_provider.dart';

import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/post_card.dart';

import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CryptoSharingBookmark extends StatefulWidget {
  const CryptoSharingBookmark({super.key});

  @override
  State<CryptoSharingBookmark> createState() => _CryptoSharingBookmarkState();
}

class _CryptoSharingBookmarkState extends State<CryptoSharingBookmark> {
  @override
  initState() {
    super.initState();
    final data = Provider.of<AuthProvider>(context, listen: false);
    Provider.of<PostProvider>(context, listen: false)
        .getSharingBookmarkData(data.getUser()!.email!);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(
              height: 10.h,
            ),
            Consumer<PostProvider>(
              builder: (context, value, child) => value.loading
                  ? CircularProgressIndicator()
                  : value.sharingBookmark.isEmpty
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
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.sharingBookmark.length,
                          itemBuilder: (context, index) {
                            List<String> userBookmarked = List<String>.from(
                                value.allSharing[index].userBookmarked as List);
                            return InkWell(
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                Navigator.pushNamed(context, "/sharing-detail",
                                    arguments: {
                                      'id': value.sharingBookmark[index].id,
                                      'title': value
                                          .sharingBookmark[index].postTitle,
                                      'body':
                                          value.sharingBookmark[index].postBody,
                                      'like': value.sharingBookmark[index].like,
                                      'dislike':
                                          value.sharingBookmark[index].dislike,
                                      'category':
                                          value.sharingBookmark[index].category,
                                      'comment':
                                          value.sharingBookmark[index].comment,
                                      'tag': value.sharingBookmark[index].tags,
                                      'username':
                                          value.sharingBookmark[index].username,
                                      'userBookmarked': userBookmarked,
                                    });
                              },
                              child: Consumer<AuthProvider>(
                                builder: (context, user, child) => PostCard(
                                  comment: value.allSharing[index].comment,
                                  isBookmark: userBookmarked
                                      .contains(user.getUser()!.email),
                                  isPost: true,
                                  tag: value.allSharing[index].tags,
                                  category:
                                      value.sharingBookmark[index].category,
                                  postTitle:
                                      value.sharingBookmark[index].postTitle,
                                  postBody:
                                      value.sharingBookmark[index].postBody,
                                  dislike: value.sharingBookmark[index].dislike
                                      .toString(),
                                  like: value.sharingBookmark[index].like
                                      .toString(),
                                  username:
                                      value.sharingBookmark[index].username,
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
