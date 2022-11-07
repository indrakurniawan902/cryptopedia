import 'package:cryptopedia/model/crypto_101/api/bookmark_api.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/components/crypto101_appbar.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../provider/crypto_101_provider.dart';
import '../components/pop_up_dialog.dart';
import '../components/post_card.dart';

class DetailCrypto101 extends StatefulWidget {
  const DetailCrypto101({super.key});

  @override
  State<DetailCrypto101> createState() => _DetailCrypto101State();
}

class _DetailCrypto101State extends State<DetailCrypto101> {
  bool isLoading = false;

  @override
  initState() {
    super.initState();
    Provider.of<Crypto101Provider>(context, listen: false).get101Data();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final crypto101 = Provider.of<Crypto101Provider>(context);
    final data = Provider.of<AuthProvider>(context, listen: false);

    Map<String, dynamic> argsArticle =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String id = argsArticle['id'];

    List userBookmarked = argsArticle['userBookmarked'];
    bool isBookmarked =
        argsArticle['userBookmarked'].contains(data.getUser()!.email);

    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: Crypto101Appbar(
          size: 65,
          title: 'Crypto 101',
          articleId: id,
          isBookmarked: isBookmarked,
          bookmarkFunction: () async {
            setState(() {
              isLoading = true;
            });
            await Crypto101AddBookmarkApi.addBookmark(
                data.getUser()!.email!, id);
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
                      ? 'This article added to bookmark!'
                      : 'This article removed from bookmark!',
                );
              },
            );
            print(isBookmarked);
          },
        ),
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: 80.h,
            color: AppColors.primaryBrand,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: value.themeValue == false
                          ? AppColors.lightColor
                          : AppColors.darkModeFrame,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          argsArticle['title'],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          argsArticle['body'],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14.sp,
                            color: value.themeValue == false
                                ? AppColors.darkModeFrame
                                : AppColors.gray5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Other helpful guide",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: crypto101.articles.length,
                    itemBuilder: (context, index) {
                      final article = crypto101.articles[index];
                      List<String> userBookmarked =
                          List<String>.from(article.userBookmarked as List);

                      return InkWell(
                        splashColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                        onTap: () {
                          Navigator.pushNamed(context, "/101-detail",
                              arguments: {
                                'id': article.id,
                                'title': article.title,
                                'body': article.body,
                              });
                        },
                        child: PostCard(
                          isBookmark:
                              userBookmarked.contains(data.getUser()!.email),
                          postTitle: article.title,
                          postBody: article.body,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          isLoading
              ? Container(
                  width: double.infinity,
                  color: Color.fromARGB(120, 255, 255, 255),
                  child: Center(
                    child: CircularProgressIndicator(
                        color: AppColors.primaryBrand),
                  ),
                )
              : SizedBox(),
        ]),
      ),
    );
  }
}
