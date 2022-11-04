import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:cryptopedia/utils/constant/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PostAppbar extends StatelessWidget with PreferredSizeWidget {
  const PostAppbar({
    super.key,
    required this.size,
    required this.isContent,
    required this.title,
    this.subTitle,
    this.secondSubTitle,
  });
  final bool isContent;

  final String title;
  final double size;
  final String? subTitle;
  final String? secondSubTitle;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => AppBar(
          backgroundColor: AppColors.primaryBrand,
          centerTitle: !isContent,
          elevation: 0,
          toolbarHeight: isContent == true ? 171.h : 79.h,
          title: isContent
              ? Container(
                  // height: 126.h,
                  padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: headerTitle,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        subTitle!,
                        style: subtitleStyle,
                      ),
                      Text(
                        secondSubTitle!,
                        style: subtitleStyle,
                      ),
                    ],
                  ),
                )
              : Text(
                  title,
                  style: headerTitle,
                ),
          leading: isContent == false
              ? IconButton(
                  iconSize: 24.h,
                  color: value.themeValue == false
                      ? AppColors.lightColor
                      : AppColors.darkModeBg,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(FeatherIcons.chevronLeft))
              : null,
          foregroundColor: value.themeValue == false
              ? AppColors.lightColor
              : AppColors.darkModeBg,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(45.h),
              child: Container(
                height: 45,
                color: AppColors.primaryBrand,
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                        strokeAlign: StrokeAlign.center,
                        width: 5.0,
                        style: BorderStyle.solid,
                        color: value.themeValue == false
                            ? AppColors.lightColor
                            : AppColors.darkModeFrame),
                    insets: const EdgeInsets.symmetric(vertical: 1),
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 5,
                  tabs: isContent ? Helper.tabsPost : Helper.tabs,
                  labelColor: value.themeValue == false
                      ? AppColors.lightColor
                      : AppColors.darkModeFrame,
                  labelStyle: selectedindex,
                  unselectedLabelStyle: textProfile,
                ),
              ))),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
