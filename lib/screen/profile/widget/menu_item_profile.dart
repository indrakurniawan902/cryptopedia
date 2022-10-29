import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:provider/provider.dart';

class MenuItemProfile extends StatefulWidget {
  final IconData? leading;
  final IconData? trailing;
  final bool? isLogout;
  final bool? isToogle;
  final String? title;
  final VoidCallback? onTilepress;

  const MenuItemProfile({
    Key? key,
    this.leading,
    this.title,
    this.onTilepress,
    this.isLogout,
    this.trailing,
    this.isToogle,
  }) : super(key: key);

  @override
  State<MenuItemProfile> createState() => _MenuItemProfileState();
}

class _MenuItemProfileState extends State<MenuItemProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) => Material(
        color: value.themeValue == false
            ? AppColors.lightColor
            : AppColors.darkModeFrame,
        child: InkWell(
          onTap: widget.onTilepress,
          child: SizedBox(
            height: 40.h,
            width: 315.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(widget.leading,
                        color: widget.isLogout == true
                            ? AppColors.error
                            : AppColors.primaryBrand),
                    SizedBox(
                      width: 15.w,
                    ),
                    Text(
                      widget.title!,
                      style: textProfile,
                    )
                  ],
                ),
                widget.isToogle == true
                    ? Consumer<ThemeProvider>(
                        builder: (context, theme, child) => Switch(
                          activeColor: AppColors.primaryBrand,
                          value: theme.themeValue,
                          onChanged: (value) {
                            setState(() {
                              theme.themeValue = value;
                            });
                          },
                        ),
                      )
                    : Icon(widget.trailing),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
