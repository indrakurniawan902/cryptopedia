import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/form_field_component.dart';
import '../components/post_card.dart';

class Crypto101All extends StatefulWidget {
  const Crypto101All({super.key});

  @override
  State<Crypto101All> createState() => _Crypto101AllState();
}

class _Crypto101AllState extends State<Crypto101All> {
  @override
  Widget build(BuildContext context) {
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
            itemCount: 20,
            itemBuilder: (context, index) => InkWell(
              splashColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
              onTap: () {},
              child: const PostCard(
                isBookmark: true,
                isPost: true,
                category: 'YEY',
                postTitle: 'postTitle',
                postBody: 'da',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
