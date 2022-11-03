import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(
        size: 65.h,
        fontSize: 12.sp,
        title: '',
        isHomepage: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 88.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 92.h,
                ),
                SizedBox(
                  height: 88.h,
                ),
                SizedBox(height: 20.h),
                Text('My Post'),
                SizedBox(
                  height: 10.h,
                ),
                PostCard(
                  postTitle: 'Trend cyrpto in 2023 ',
                  isPost: true,
                  category: 'Category',
                  comment: '1',
                  like: '1',
                  dislike: '1',
                  isBookmark: true,
                  username: 'Indra',
                  postBody:
                      'To find out the fundamentals of a coin/token we can do an analysis through the coinmarketcap website where we can take information from a coin...',
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
