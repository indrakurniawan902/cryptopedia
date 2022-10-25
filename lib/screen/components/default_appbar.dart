import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  const DefaultAppbar(
      {super.key,
      required this.size,
      required this.title,
      required this.isBack,
      required this.fontSize});

  final double size;
  final double fontSize;
  final String title;
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: size.h,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      title: Text(
        title,
        style: TextStyle(fontSize: fontSize),
      ),
      centerTitle: true,
      leading: isBack == true
          ? IconButton(
              icon: const Icon(FeatherIcons.chevronLeft),
              onPressed: () => Navigator.pop(context),
            )
          : const SizedBox(),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: AppColors.primaryBrand,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
