import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CryptoSharingAll extends StatefulWidget {
  const CryptoSharingAll({super.key});

  @override
  State<CryptoSharingAll> createState() => _CryptoSharingAllState();
}

class _CryptoSharingAllState extends State<CryptoSharingAll> {
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // final data = Provider.of<AuthProvider>(context, listen: false);
      Provider.of<PostProvider>(context, listen: false).getAllPostData();
      // Provider.of<PostProvider>(context, listen: false)
      //     .getSharingBookmarkData(data.getUser()!.email!);
    });
    super.didChangeDependencies();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     // final data = Provider.of<AuthProvider>(context, listen: false);
  //     Provider.of<PostProvider>(context, listen: false).getAllPostData();
  //     // Provider.of<PostProvider>(context, listen: false)
  //     //     .getSharingBookmarkData(data.getUser()!.email!);
  //   });
  // }

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
              builder: (context, value, child) => value.state ==
                      PostViewState.loading
                  ? const CircularProgressIndicator()
                  : value.allSharing.isEmpty
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
                          itemCount: value.allSharing.length,
                          itemBuilder: (context, index) {
                            List<String> userBookmarked = List<String>.from(
                                value.allSharing[index].userBookmarked as List);
                            return InkWell(
                              splashColor: Colors.transparent,
                              splashFactory: NoSplash.splashFactory,
                              onTap: () {
                                Navigator.pushNamed(context, "/sharing-detail",
                                    arguments: {
                                      'index': index,
                                      'id': value.allSharing[index].id,
                                      'title':
                                          value.allSharing[index].postTitle,
                                      'body': value.allSharing[index].postBody,
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
                                  isBookmark: userBookmarked
                                      .contains(user.getUser()!.email),
                                  isPost: true,
                                  tag: value.allSharing[index].tags,
                                  category: value.allSharing[index].category!,
                                  postTitle: value.allSharing[index].postTitle!,
                                  postBody: value.allSharing[index].postBody,
                                  dislike: value.allSharing[index].dislike
                                      .toString(),
                                  like: value.allSharing[index].like.toString(),
                                  username: value.allSharing[index].username,
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
