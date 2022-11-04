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
  Widget build(BuildContext context) {
    final crypto101 = Provider.of<Crypto101Provider>(context);
    final data = Provider.of<AuthProvider>(context, listen: false);

    crypto101.get101BookmarkData(data.getUser()!.email!);

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
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: crypto101.articles.length,
            itemBuilder: (context, index) => const PostCard(
              isBookmark: true,
              isPost: true,
              category: 'YEY',
              postTitle: 'postTitle',
              postBody: 'da',
            ),
          ),
        ],
      ),
    );
  }
}
