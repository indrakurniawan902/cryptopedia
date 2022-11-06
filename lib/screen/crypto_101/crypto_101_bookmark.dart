import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../provider/crypto_101_provider.dart';
import '../components/form_field_component.dart';
import '../components/post_card.dart';

class Crypto101Bookmark extends StatefulWidget {
  const Crypto101Bookmark({super.key});

  @override
  State<Crypto101Bookmark> createState() => _Crypto101BookmarkState();
}

class _Crypto101BookmarkState extends State<Crypto101Bookmark> {
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

    return SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
            height: 20.h,
          ),
          crypto101.articles.length == 0
              ? Center(
                  child: Text(
                  "Currently, no bookmark for crypto 101 here",
                ))
              : SizedBox(),
          crypto101.loading
              ? Center(child: CircularProgressIndicator())
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
