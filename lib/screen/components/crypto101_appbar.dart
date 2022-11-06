import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Crypto101Appbar extends StatelessWidget with PreferredSizeWidget {
  const Crypto101Appbar({
    super.key,
    required this.size,
    required this.title,
    this.user,
    this.isHomepage,
    this.isBookmarked,
    required this.articleId,
    required this.bookmarkFunction,
  });

  final double size;
  final String title;
  final String articleId;
  final String? user;
  final bool? isHomepage;
  final bool? isBookmarked;
  final Function() bookmarkFunction;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => AppBar(
        toolbarHeight: size.h,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Poppins-SemiBold',
              color: value.themeValue == false
                  ? AppColors.lightColor
                  : AppColors.darkModeBg),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: value.themeValue == false
                ? AppColors.lightColor
                : AppColors.darkModeBg,
            icon: Icon(isBookmarked == true
                ? Icons.bookmark
                : Icons.bookmark_add_outlined),
            onPressed: bookmarkFunction,
          )
        ],
        leading: IconButton(
          color: value.themeValue == false
              ? AppColors.lightColor
              : AppColors.darkModeBg,
          icon: const Icon(FeatherIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryBrand,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
