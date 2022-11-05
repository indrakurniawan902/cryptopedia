import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostProvider>(
        builder: (context, value, child) => value.sharingBookmark.isEmpty
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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.sharingBookmark.length,
                      itemBuilder: (context, index) => PostCard(
                        isBookmark: true,
                        isPost: true,
                        category: value.sharingBookmark[index].category!,
                        postTitle: value.sharingBookmark[index].postTitle!,
                        postBody: value.sharingBookmark[index].postBody,
                        dislike:
                            value.sharingBookmark[index].dislike.toString(),
                        like: value.sharingBookmark[index].like.toString(),
                        username: value.sharingBookmark[index].username,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
