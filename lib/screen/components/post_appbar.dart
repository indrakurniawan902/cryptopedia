import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostAppbar extends StatelessWidget {
  const PostAppbar({
    super.key,
    required this.size,
    required this.isContent,
    required this.fontSize,
    required this.title,
  });
  final bool isContent;
  final String title;
  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isContent,
      toolbarHeight: isContent == true ? 79.h : 126.h,
      title: Text(
        title,
        style: isContent ? headerTitle : headerTitleSmall,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.bookmark_added_outlined),
          onPressed: () {},
        )
      ],
      leading: isContent == false
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(FeatherIcons.chevronLeft))
          : const SizedBox(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
