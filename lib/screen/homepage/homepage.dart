import 'package:cryptopedia/provider/coin_provider.dart';
import 'package:cryptopedia/provider/post_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/components/crypto_card.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/components/post_card.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const <BoxShadow>[
                        AppShadow.shadow1,
                      ],
                      color: value.themeValue == false
                          ? AppColors.lightColor
                          : AppColors.darkModeFrame,
                    ),
                    padding: EdgeInsets.all(10.h),
                    child: Consumer<CoinProvider>(
                      builder: (context, value, child) => value
                                  .getListCoinSortMarket.isNotEmpty &
                              value.getListCoinSortPrice.isNotEmpty &
                              value.getListCoin.isNotEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CryptoCard(
                                  title: 'Trending',
                                  isTrend: true,
                                  assetPath: 'assets/images/trending_up.png',
                                  coinName: value.getListCoinSortMarket
                                      .elementAt(0)
                                      .name,
                                  networkPath: value.getListCoinSortMarket
                                      .elementAt(0)
                                      .image,
                                ),
                                CryptoCard(
                                  title: 'Hot Project',
                                  assetPath: 'assets/images/hot.png',
                                  isTrend: true,
                                  coinName: value.getListCoinSortPrice
                                      .elementAt(0)
                                      .name,
                                  networkPath: value.getListCoinSortPrice
                                      .elementAt(0)
                                      .image,
                                ),
                                CryptoCard(
                                  title: 'Global Trend',
                                  isOnlyTrend: true,
                                  assetPath: value.getListCoin
                                              .elementAt(0)
                                              .priceChangePercentage24h! >
                                          0
                                      ? 'assets/images/trending_up.png'
                                      : 'assets/images/trending_down.png',
                                ),
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => Container(
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const <BoxShadow>[
                        AppShadow.shadow1,
                      ],
                      color: value.themeValue == false
                          ? AppColors.lightColor
                          : AppColors.darkModeFrame,
                    ),
                    padding: EdgeInsets.all(10.h),
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) =>
                          Consumer<CoinProvider>(
                        builder: (context, value, child) => value
                                .getListCoin.isNotEmpty
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CryptoCard(
                                    title: value.getListCoin[index].symbol!,
                                    percent: value.getListCoin[index]
                                        .priceChangePercentage24h!,
                                    isRank: true,
                                    price:
                                        value.getListCoin[index].currentPrice,
                                  ),
                                  CryptoCard(
                                    title: value.getListCoin[index + 3].symbol!,
                                    percent: value.getListCoin[index + 3]
                                        .priceChangePercentage24h!,
                                    isRank: true,
                                    price: value
                                        .getListCoin[index + 3].currentPrice,
                                  ),
                                  CryptoCard(
                                    title: value.getListCoin[index + 5].symbol!,
                                    percent: value.getListCoin[index + 5]
                                        .priceChangePercentage24h!,
                                    isRank: true,
                                    price: value
                                        .getListCoin[index + 5].currentPrice,
                                  ),
                                ],
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'My Post',
                  style: myPost,
                ),
                SizedBox(height: 10.h),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => Consumer<PostProvider>(
                    builder: (context, post, child) => Center(
                        child: post.myPostSharing.isEmpty & post.loading
                            ? const CircularProgressIndicator()
                            : post.myPostSharing.isNotEmpty
                                ? Column(
                                    children: [
                                      PostCard(
                                          postTitle: post.myPostSharing
                                              .elementAt(0)
                                              .postTitle!,
                                          category: post.myPostSharing
                                              .elementAt(0)
                                              .category!,
                                          dislike: post.myPostSharing
                                              .elementAt(0)
                                              .dislike!
                                              .toString(),
                                          like: post.myPostSharing
                                              .elementAt(0)
                                              .like!
                                              .toString(),
                                          isBookmark: true,
                                          isPost: true,
                                          postBody: post.myPostSharing
                                              .elementAt(0)
                                              .postBody!,
                                          username: post.myPostSharing
                                              .elementAt(0)
                                              .username!),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      SizedBox(
                                        height: 35.h,
                                        width: 335.w,
                                        child: ElevatedButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    value.themeValue == false
                                                        ? AppColors.lightColor
                                                        : AppColors
                                                            .darkModeFrame),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/my-post');
                                            },
                                            child: Text(
                                              'See More',
                                              style: TextStyle(
                                                color: value.themeValue == false
                                                    ? AppColors.darkColor
                                                    : AppColors.lightColor,
                                              ),
                                            )),
                                      )
                                    ],
                                  )
                                : Consumer<ThemeProvider>(
                                    builder: (context, value, child) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const <BoxShadow>[
                                          AppShadow.shadow1,
                                        ],
                                        color: value.themeValue == false
                                            ? AppColors.lightColor
                                            : AppColors.darkModeFrame,
                                      ),
                                      padding: EdgeInsets.all(10.h),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            'assets/images/no_post.png',
                                            height: 120.h,
                                            width: 158.w,
                                          ),
                                          // SizedBox(height: 5.h),
                                          Text(
                                            'You don’t have post yet',
                                            style: noPost,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'All Post',
                  style: myPost,
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
                      isBookmark: false,
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
        ),
      ),
    );
  }
}
