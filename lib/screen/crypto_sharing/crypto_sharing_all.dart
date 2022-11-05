import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
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
              builder: (context, value, child) => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.allSharing.length,
                itemBuilder: (context, index) => PostCard(
                  isBookmark: true,
                  isPost: true,
                  category: value.allSharing[index].category!,
                  postTitle: value.allSharing[index].postTitle!,
                  postBody: value.allSharing[index].postBody,
                  dislike: value.allSharing[index].dislike.toString(),
                  like: value.allSharing[index].like.toString(),
                  username: value.allSharing[index].username,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
