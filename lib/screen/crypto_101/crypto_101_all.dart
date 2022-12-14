import 'package:cryptopedia/provider/crypto_101_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../components/form_field_component.dart';
import '../components/post_card.dart';

class Crypto101All extends StatefulWidget {
  const Crypto101All({super.key});

  @override
  State<Crypto101All> createState() => _Crypto101AllState();
}

class _Crypto101AllState extends State<Crypto101All> {
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

    void handleSearch(String keyword) {
      crypto101.search101(keyword);
    }

    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Consumer<Crypto101Provider>(
        builder: (context, value, child) => Column(
          children: [
            FormFieldComponent(
              isDisable: false,
              isSearchBar: true,
              placeholder: 'Search',
              changeHandler: handleSearch,
              name: '',
            ),
            SizedBox(
              height: 20.h,
            ),
            value.articles.length == 0
                ? Center(
                    child: Text(
                    "Currently, no crypto 101 here",
                  ))
                : SizedBox(),
            value.loading
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primaryBrand,
                  ))
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.articles.length,
                    itemBuilder: (context, index) {
                      final article = value.articles[index];
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
                                'userBookmarked': userBookmarked,
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
    );
  }
}
