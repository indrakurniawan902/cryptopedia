import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/crypto_101_provider.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkCrypto101 extends StatefulWidget {
  const BookmarkCrypto101({super.key});

  @override
  State<BookmarkCrypto101> createState() => _BookmarkCrypto101State();
}

class _BookmarkCrypto101State extends State<BookmarkCrypto101> {
  @override
  initState() {
    super.initState();
    final data = Provider.of<AuthProvider>(context, listen: false);
    Provider.of<Crypto101Provider>(context, listen: false)
        .get101BookmarkData(data.getUser()!.email!);
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
      crypto101.search101Bookmark(data.getUser()!.email!, keyword);
    }

    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          FormFieldComponent(
            isDisable: false,
            isSearchBar: true,
            placeholder: 'Search',
            name: '',
            changeHandler: handleSearch,
          ),
          SizedBox(
            height: 20.h,
          ),
          crypto101.articles.isEmpty && !crypto101.loading
              ? const Center(
                  child: Text(
                  "Currently, no bookmark for crypto 101 here",
                ))
              : const SizedBox(),
          crypto101.loading
              ? const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryBrand))
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: crypto101.articles.length,
                  itemBuilder: (context, index) {
                    final article = crypto101.articles[index];
                    return InkWell(
                      splashColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        Navigator.pushNamed(context, "/101-detail", arguments: {
                          'id': article.id,
                          'title': article.title,
                          'body': article.body,
                        });
                      },
                      child: PostCard(
                        isBookmark: true,
                        postTitle: article.title,
                        postBody: article.body,
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}
