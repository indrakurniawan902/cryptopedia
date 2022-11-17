import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

final formKey = GlobalKey<FormState>();

class _MyProfileState extends State<MyProfile> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final data = Provider.of<AuthProvider>(context, listen: false);
      Provider.of<UserProvider>(context, listen: false)
          .getUserData(data.getUser()!.email!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbar(
          size: 65,
          title: 'My Profile',
          isBack: true,
          fontSize: 24,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
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
                  height: 21.h,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Consumer<ThemeProvider>(
                            builder: (context, value, child) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 20.h),
                              decoration: BoxDecoration(
                                  color: value.themeValue == false
                                      ? AppColors.lightColor
                                      : AppColors.darkModeFrame,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const <BoxShadow>[
                                    AppShadow.shadow1,
                                  ]),
                              child: Column(
                                children: [
                                  Consumer<UserProvider>(
                                    builder: (context, value, child) =>
                                        FormFieldComponent(
                                      name: "Email",
                                      initialValue: value.users.email,
                                      isDisable: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Consumer<UserProvider>(
                                    builder: (context, value, child) =>
                                        FormFieldComponent(
                                      name: "Fullname",
                                      initialValue: value.users.name,
                                      isDisable: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Consumer<UserProvider>(
                                    builder: (context, value, child) =>
                                        FormFieldComponent(
                                      name: "Username",
                                      initialValue: value.users.username,
                                      isDisable: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32.h,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ButtonComponent(
                                text: "Edit Profile",
                                onClickFunction: () {
                                  Navigator.pushNamed(context, '/edit-profile');
                                },
                                isDisable: false),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
