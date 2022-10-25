import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/profile/widget/menu_item_profile.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbar(
          size: 65,
          title: 'Profile',
          isBack: false,
          fontSize: 24,
        ),
        body: Container(
          color: AppColors.lightModeBgHome,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 21.h,
              ),
              const CircleAvatar(
                maxRadius: 60,
                minRadius: 60,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Fullname',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                '@Username',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.gray2,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(
                height: 21.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 257.h,
                padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const MenuItemProfile(
                      title: 'My Profile',
                      leading: FeatherIcons.user,
                      trailing: FeatherIcons.chevronRight,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const MenuItemProfile(
                      title: 'My Post',
                      leading: FeatherIcons.archive,
                      trailing: FeatherIcons.chevronRight,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const MenuItemProfile(
                      title: 'My Bookmark',
                      leading: FeatherIcons.bookmark,
                      trailing: FeatherIcons.chevronRight,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const MenuItemProfile(
                      isToogle: true,
                      title: 'Dark Mode',
                      leading: FeatherIcons.moon,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Divider(
                      color: AppColors.gray4,
                      thickness: 0.8,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const MenuItemProfile(
                      title: 'About App',
                      leading: FeatherIcons.info,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 52.h,
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Consumer<AuthProvider>(
                      builder: (context, value, child) => MenuItemProfile(
                        onTilepress: () {
                          value.logout();
                        },
                        isLogout: true,
                        title: 'Log oout',
                        leading: FeatherIcons.logOut,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
