import 'package:cryptopedia/model/user/user_model.dart';
import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/profile/widget/menu_item_profile.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbar(
          size: 65,
          title: 'Profile',
          isBack: false,
          fontSize: 24,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 21.h,
                ),
                Consumer<AuthProvider>(
                  builder: (context, auth, _) => CircleAvatar(
                    backgroundImage: NetworkImage(auth.getUser()!.photoURL!),
                    maxRadius: 60,
                    minRadius: 60,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Consumer<UserProvider>(
                  builder: (context, user, child) => Text(
                    user.users.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Consumer<UserProvider>(
                  builder: (context, user, child) => Consumer<ThemeProvider>(
                    builder: (context, value, child) => Text(
                      '@${user.users.username}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: value.themeValue == false
                            ? AppColors.gray2
                            : AppColors.lightColor,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => Container(
                    decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        AppShadow.shadow1,
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: value.themeValue == false
                          ? AppColors.lightColor
                          : AppColors.darkModeFrame,
                    ),
                    height: 307.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.w, horizontal: 10.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MenuItemProfile(
                          title: 'My Profile',
                          onTilepress: () =>
                              Navigator.pushNamed(context, '/my-profile'),
                          leading: FeatherIcons.user,
                          trailing: FeatherIcons.chevronRight,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        MenuItemProfile(
                          title: 'My Post',
                          leading: FeatherIcons.archive,
                          trailing: FeatherIcons.chevronRight,
                          onTilepress: () =>
                              Navigator.pushNamed(context, '/my-post'),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        MenuItemProfile(
                          title: 'My Bookmark',
                          leading: FeatherIcons.bookmark,
                          trailing: FeatherIcons.chevronRight,
                          onTilepress: () =>
                              Navigator.pushNamed(context, '/bookmark'),
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
                        Consumer<ThemeProvider>(
                          builder: (context, value, child) => Divider(
                            color: value.themeValue == false
                                ? AppColors.gray4
                                : AppColors.lightColor,
                            thickness: 0.8,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        MenuItemProfile(
                          title: 'About App',
                          onTilepress: () =>
                              Navigator.pushNamed(context, '/about-app'),
                          leading: FeatherIcons.info,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<ThemeProvider>(
                  builder: (context, value, child) => Container(
                    decoration: BoxDecoration(
                      boxShadow: const <BoxShadow>[
                        AppShadow.shadow1,
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: value.themeValue == false
                          ? AppColors.lightColor
                          : AppColors.darkModeFrame,
                    ),
                    height: 62.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.h),
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
                ),
                SizedBox(
                  height: 64.h,
                ),
                Text(
                  '© 2022 cryptopedia',
                  textAlign: TextAlign.center,
                  style: copyRight,
                ),
                SizedBox(
                  height: 11.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
