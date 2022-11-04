import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Crypto101Appbar extends StatelessWidget with PreferredSizeWidget {
  const Crypto101Appbar(
      {super.key,
      required this.size,
      required this.title,
      this.user,
      this.isBack,
      this.isHomepage,
      required this.fontSize});

  final double size;
  final double fontSize;
  final String title;
  final String? user;
  final bool? isBack;
  final bool? isHomepage;
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
            icon: const Icon(Icons.bookmark_add_outlined),
            onPressed: () => Navigator.pop(context),
          )
        ],
        leading: isBack == true
            ? IconButton(
                color: value.themeValue == false
                    ? AppColors.lightColor
                    : AppColors.darkModeBg,
                icon: const Icon(FeatherIcons.chevronLeft),
                onPressed: () => Navigator.pop(context),
              )
            : isHomepage == true
                ? Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 17.h, 0, 17.h),
                    child: Image.asset(
                        cacheHeight: 32.h.toInt(),
                        cacheWidth: 35.w.toInt(),
                        'assets/images/icon_home.png'),
                  )
                : const SizedBox(),
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
