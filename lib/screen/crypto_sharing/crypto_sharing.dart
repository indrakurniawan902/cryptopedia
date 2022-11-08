import 'package:cryptopedia/screen/components/post_appbar.dart';
import 'package:cryptopedia/utils/constant/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoSharing extends StatefulWidget {
  const CryptoSharing({super.key});

  @override
  State<CryptoSharing> createState() => _CryptoSharingState();
}

class _CryptoSharingState extends State<CryptoSharing> {
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
                title: 'Crypto Sharing',
                subTitle: ' Learn crypto trends, fundamental ',
                secondSubTitle: ' technical analysis, and basic crypto',
              )),
          body: TabBarView(children: Helper.tabViewSharing),
        ),
      ),
    );
  }
}
