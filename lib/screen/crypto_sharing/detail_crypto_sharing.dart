import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/screen/components/crypto101_appbar.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final data = Provider.of<AuthProvider>(context, listen: false);
      Provider.of<PostProvider>(context, listen: false).getAllPostData();
      Provider.of<PostProvider>(context, listen: false)
          .getSharingBookmarkData(data.getUser()!.email!);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<AuthProvider>(context, listen: false);
    TextEditingController commentControler = TextEditingController();
    final ScrollController scrollController = ScrollController();

    void _scrollDown() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    Map<String, dynamic> argsSharing =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String id = argsSharing['id'];
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PopUpDialog(
                        type: 'success',
                        title: 'Success!',
                        description: isBookmarked
                            ? 'This post removed from bookmark!'
                            : 'This post added to bookmark!',
                      );
                    },
                  );
                  await value.changeBookmarkStatus(data.getUser()!.email!, id);
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
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 75.h),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          maximumSize: Size(167.w, 45.h),
                                          backgroundColor:
                                              theme.themeValue == false
                                                  ? AppColors.lightColor
                                                  : AppColors.darkModeFrame),
                                      onPressed: () async {
                                        await value.likeAction(
                                            data.getUser()!.email!, id);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                          backgroundColor:
                                              theme.themeValue == false
                                                  ? AppColors.lightColor
                                                  : AppColors.darkModeFrame),
                                      onPressed: () async {
                                        await value.dislikeAction(
                                            data.getUser()!.email!, id);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Consumer<ThemeProvider>(
                              builder: (context, theme, child) => value
                                          .allSharing[argsSharing['index']]
                                          .comment ==
                                      null
                                  ? Text('No Comment')
                                  : ListView.builder(
                                      controller: scrollController,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: value
                                          .allSharing[argsSharing['index']]
                                          .comment!
                                          .length,
                                      itemBuilder: (context, index) =>
                                          Container(
                                        margin: EdgeInsets.only(bottom: 10.h),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const <BoxShadow>[
                                            AppShadow.shadow1,
                                          ],
                                          color: theme.themeValue == false
                                              ? AppColors.lightColor
                                              : AppColors.darkModeFrame,
                                        ),
                                        padding: EdgeInsets.all(10.h),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    value
                                                        .allSharing[argsSharing[
                                                            'index']]
                                                        .comment![index][3],
                                                  ),
                                                  maxRadius: 20.h,
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value
                                                          .allSharing[
                                                              argsSharing[
                                                                  'index']]
                                                          .comment![index][1],
                                                      style: commentFullname,
                                                    ),
                                                    Text(
                                                      value
                                                          .allSharing[
                                                              argsSharing[
                                                                  'index']]
                                                          .comment![index][2],
                                                      style: commentUsername,
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: AppColors.primary5,
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                boxShadow: const <BoxShadow>[
                                                  AppShadow.shadow1,
                                                ],
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h,
                                                  horizontal: 10.w),
                                              child: Text(
                                                value
                                                    .allSharing[
                                                        argsSharing['index']]
                                                    .comment![index][0],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Consumer<ThemeProvider>(
                          builder: (context, theme, child) => Container(
                              width: double.infinity,
                              height: 80.h,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                boxShadow: const <BoxShadow>[
                                  AppShadow.shadow1,
                                ],
                                color: theme.themeValue == false
                                    ? AppColors.lightColor
                                    : AppColors.darkModeFrame,
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: FormFieldComponent(
                                    controller: commentControler,
                                    isDisable: false,
                                    isComment: true,
                                    placeholder: 'Type your comment',
                                  )),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Consumer<UserProvider>(
                                    builder: (context, user, child) =>
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColors.primaryBrand,
                                              shape: const CircleBorder(),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 13.h),
                                            ),
                                            onPressed: () async {
                                              await value.addComment(
                                                  id,
                                                  commentControler.text,
                                                  user.users.name,
                                                  user.users.username,
                                                  data.getUser()!.photoURL!,
                                                  argsSharing['index']);
                                              commentControler.clear();
                                              _scrollDown();
                                            },
                                            child: const Icon(
                                              FeatherIcons.send,
                                              size: 18,
                                            )),
                                  )
                                ],
                              )),
                        )),
                  ],
                ),
              ),
            ));
  }
}
