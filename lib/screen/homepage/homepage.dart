import 'package:cryptopedia/provider/coin_provider.dart';
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
                      builder: (context, value, child) => value.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Row(
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
                                      .elementAt(1)
                                      .name,
                                  networkPath: value.getListCoinSortPrice
                                      .elementAt(1)
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
                        builder: (context, value, child) => value.loading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Row(
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
                                    title: value.getListCoin[index + 1].symbol!,
                                    percent: value.getListCoin[index + 1]
                                        .priceChangePercentage24h!,
                                    isRank: true,
                                    price: value
                                        .getListCoin[index + 1].currentPrice,
                                  ),
                                  CryptoCard(
                                    title: value.getListCoin[index + 2].symbol!,
                                    percent: value.getListCoin[index + 2]
                                        .priceChangePercentage24h!,
                                    isRank: true,
                                    price: value
                                        .getListCoin[index + 2].currentPrice,
                                  ),
                                ],
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
                  builder: (context, value, child) => Container(
                    height: 166.h,
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
                    child: Center(
                      child: Text('NO POST'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const PostCard(
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
                Consumer<CoinProvider>(
                    builder: (context, value, child) =>
                        Text(value.getListCoin.length.toString())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
