import 'package:cryptopedia/model/post_model/api/post_api.dart';
import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/components/crypto101_appbar.dart';
import 'package:cryptopedia/screen/components/pop_up_dialog.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailCryptoSharing extends StatefulWidget {
  const DetailCryptoSharing({super.key});

  @override
  State<DetailCryptoSharing> createState() => _DetailCryptoSharingState();
}

class _DetailCryptoSharingState extends State<DetailCryptoSharing> {
  @override
  initState() {
    super.initState();
    final data = Provider.of<AuthProvider>(context, listen: false);
    Provider.of<PostProvider>(context, listen: false)
        .getSharingBookmarkData(data.getUser()!.email!);
    Provider.of<PostProvider>(context, listen: false).getAllPostData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final action = Provider.of<PostProvider>(context, listen: false);
    final data = Provider.of<AuthProvider>(context, listen: false);
    Map<String, dynamic> argsSharing =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String id = argsSharing['id'];
    bool isLoading = false;
    List userBookmarked = argsSharing['userBookmarked'];
    bool isBookmarked =
        argsSharing['userBookmarked'].contains(data.getUser()!.email);
    return Consumer<PostProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: Crypto101Appbar(
          size: 65,
          title: 'Crypto Sharing',
          articleId: id,
          isBookmarked: isBookmarked,
          bookmarkFunction: () async {
            setState(() {
              isLoading = true;
            });
            await PostApi.addSharingBookmark(data.getUser()!.email!, id);
            setState(() {
              isBookmarked = !isBookmarked;
              isLoading = false;
            });
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return PopUpDialog(
                  type: 'success',
                  title: 'Success!',
                  description: isBookmarked
                      ? 'This post added to bookmark!'
                      : 'This post removed from bookmark!',
                );
              },
            );
            print(isBookmarked);
          },
        ),
        body: SafeArea(
            child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 145.h,
              color: AppColors.primaryBrand,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PostCard(
                      isDetail: true,
                      postTitle: argsSharing['title'],
                      category: argsSharing['category'],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    PostCard(
                      tag: argsSharing['tag'],
                      isDetailBody: true,
                      postBody: argsSharing['body'],
                      username: argsSharing['username'],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Consumer<ThemeProvider>(
                      builder: (context, theme, child) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const <BoxShadow>[
                            AppShadow.shadow1,
                          ],
                          color: theme.themeValue == false
                              ? AppColors.lightColor
                              : AppColors.darkModeFrame,
                        ),
                        height: 46.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  maximumSize: Size(167.w, 45.h),
                                  backgroundColor: theme.themeValue == false
                                      ? AppColors.lightColor
                                      : AppColors.darkModeFrame),
                              onPressed: () async {
                                await PostApi.addSharingLike(
                                    data.getUser()!.email!, id);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FeatherIcons.thumbsUp,
                                    color: AppColors.primaryBrand,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    argsSharing['like'].toString(),
                                    style: TextStyle(
                                        color: theme.themeValue == false
                                            ? AppColors.darkColor
                                            : AppColors.lightColor,
                                        fontSize: 17.sp),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  maximumSize: Size(167.w, 45.h),
                                  backgroundColor: theme.themeValue == false
                                      ? AppColors.lightColor
                                      : AppColors.darkModeFrame),
                              onPressed: () async {
                                await PostApi.addSharingDislike(
                                    data.getUser()!.email!, id);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    FeatherIcons.thumbsDown,
                                    color: AppColors.error,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    argsSharing['dislike'].toString(),
                                    style: TextStyle(
                                        color: theme.themeValue == false
                                            ? AppColors.darkColor
                                            : AppColors.lightColor,
                                        fontSize: 17.sp),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'Comment',
                      style: myPost,
                    )
                  ],
                ),
              ),
            ),
            isLoading
                ? Container(
                    width: double.infinity,
                    color: const Color.fromARGB(120, 255, 255, 255),
                    child: const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryBrand),
                    ),
                  )
                : const SizedBox(),
          ],
        )),
      ),
    );
  }
}
