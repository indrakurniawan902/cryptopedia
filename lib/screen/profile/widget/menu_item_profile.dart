import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';

class MenuItemProfile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.lightColor,
      child: InkWell(
        onTap: onTilepress,
        child: SizedBox(
          height: 40.h,
          width: 315.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(leading,
                      color: isLogout == true
                          ? AppColors.error
                          : AppColors.primaryBrand),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    title!,
                    style: textProfile,
                  )
                ],
              ),
              isToogle == true
                  ? Switch(
                      activeColor: AppColors.primaryBrand,
                      value: true,
                      onChanged: (value) {},
                    )
                  : Icon(trailing),
            ],
          ),
        ),
      ),
    );
  }
}
