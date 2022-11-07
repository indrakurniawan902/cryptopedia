import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key,
      this.postTitle,
      this.category,
      this.username,
      this.like,
      this.dislike,
      this.comment,
      this.postBody,
      this.isBookmark,
      this.isPost,
      this.isDetail,
      this.isDetailBody,
      this.tag});
  final String? username;
  final bool? isDetail;
  final bool? isDetailBody;
  final bool? isBookmark;
  final bool? isPost;
  final String? like;
  final String? dislike;
  final List? comment;
  final List<String>? tag;
  final String? postTitle;
  final String? category;
  final String? postBody;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const <BoxShadow>[
            AppShadow.shadow1,
          ],
          color: value.themeValue == false
              ? AppColors.lightColor
              : AppColors.darkModeFrame,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 260.w,
                  child: isDetailBody == true
                      ? null
                      : Text(
                          postTitle!,
                          style: isDetail == true
                              ? articleTitleStyle
                              : postTitleStyle,
                        ),
                ),
                isBookmark == true
                    ? Icon(
                        size: 24,
                        Icons.bookmark,
                        // Icons.bookmark_outline,
                        color: AppColors.primaryBrand,
                      )
                    : const SizedBox()
              ],
            ),
            isPost != null || isDetail == true
                ? Container(
                    margin: EdgeInsets.only(bottom: 8.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.primaryBrand),
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
                    child: Text(
                      category!,
                      style: categoryTitleStyle,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              width: 303.w,
              child: postBody != null
                  ? Text(
                      postBody!,
                      style: postBodyStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: isDetailBody == true ? 20 : 3,
                    )
                  : null,
            ),
            isPost == true || isDetailBody == true
                ? Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 5.h),
                    child: Row(
                      children: [
                        Text(
                          '#123 #456 #789',
                          style: tagStyle,
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
            isPost == true || isDetailBody == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        username!,
                        style: userPostStyle,
                      ),
                      isDetailBody == true
                          ? SizedBox()
                          : Row(
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/comment.svg',
                                      semanticsLabel: 'Comment Logo',
                                      color: value.themeValue == false
                                          ? AppColors.grey
                                          : AppColors.lightColor,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(comment == null
                                        ? '0'
                                        : comment!.length.toString())
                                  ],
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FeatherIcons.thumbsUp,
                                      color: AppColors.primaryBrand,
                                      size: 12.w,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(like.toString())
                                  ],
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FeatherIcons.thumbsDown,
                                      size: 12.w,
                                      color: AppColors.error,
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(dislike.toString())
                                  ],
                                )
                              ],
                            )
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
