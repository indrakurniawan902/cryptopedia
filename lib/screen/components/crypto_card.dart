import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    super.key,
    required this.title,
    this.coinName,
    this.assetPath,
    this.networkPath,
    this.percent,
    this.price,
    this.isTrend,
    this.isOnlyTrend,
    this.isRank,
  });
  final String? assetPath;
  final String? networkPath;
  final String title;
  final String? coinName;
  final double? percent;
  final price;
  final bool? isTrend;
  final bool? isOnlyTrend;
  final bool? isRank;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Container(
        width: 95.w,
        height: 88.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const <BoxShadow>[
            AppShadow.shadow1,
          ],
          color: value.themeValue == false
              ? AppColors.lightColor
              : AppColors.darkModeFrame,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: isOnlyTrend == true
                  ? MainAxisAlignment.center
                  : isRank == true
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.spaceAround,
              children: [
                isTrend == true
                    ? Image.asset(
                        assetPath!,
                        height: 12.h,
                        width: 12.w,
                      )
                    : isRank == true
                        ? Text(
                            '${title.toUpperCase()}',
                            style: assetName,
                          )
                        : Text(
                            title,
                            style: titleInCoin,
                          ),
                isTrend == true
                    ? Text(
                        title,
                        style: titleInCoin,
                      )
                    : isRank == true
                        ? Text(
                            percent! > 0
                                ? '+${percent!.toStringAsFixed(2)}%'
                                : '${percent!.toStringAsFixed(2)}%',
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: percent! > 0
                                    ? AppColors.primaryBrand
                                    : AppColors.error),
                          )
                        : Text(''),
              ],
            ),
            isTrend == true
                ? Image.network(
                    networkPath!,
                    height: 30.h,
                    width: 30.w,
                  )
                : isRank == true
                    ? Text(
                        price.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      )
                    : Image.asset(
                        assetPath!,
                        height: 40.h,
                        width: 40.w,
                      ),
            isTrend == true
                ? Text(
                    coinName!,
                    style: titleInCoin,
                    overflow: TextOverflow.ellipsis,
                  )
                : isRank == true
                    ? Text(
                        'Rp ${(price! * 15646).toStringAsFixed(1)}',
                        style: assetName,
                      )
                    : Text(''),
          ],
        ),
      ),
    );
  }
}
