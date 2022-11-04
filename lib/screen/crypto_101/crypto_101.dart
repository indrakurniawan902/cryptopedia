import 'package:cryptopedia/screen/components/post_appbar.dart';
import 'package:cryptopedia/utils/constant/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Crypto101 extends StatefulWidget {
  const Crypto101({super.key});

  @override
  State<Crypto101> createState() => _Crypto101State();
}

class _Crypto101State extends State<Crypto101> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(171.h),
              child: PostAppbar(
                size: 171.h,
                isContent: true,
                title: 'Crypto 101',
                subTitle: 'Unfamiliar with Crypto? If yes then you',
                secondSubTitle: 'are in the right page!',
              )),
          body: TabBarView(children: Helper.tabView101),
        ),
      ),
    );
  }
}
