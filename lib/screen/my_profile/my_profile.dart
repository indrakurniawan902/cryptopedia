import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

final formKey = GlobalKey<FormState>();
bool isDisable = true;
TextEditingController emailC = TextEditingController();
TextEditingController fullnameC = TextEditingController();
TextEditingController usernameC = TextEditingController();
void validateInput() {
  if (fullnameC.text != "") {}
}

class _MyProfileState extends State<MyProfile> {
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
                const CircleAvatar(
                  maxRadius: 60,
                  minRadius: 60,
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
                                  FormFieldComponent(
                                    name: "Email",
                                    // placeholder: widget.userEmail!,
                                    controller: emailC,
                                    // initialValue: widget.userEmail,
                                    validation: () {},
                                    isDisable: true,
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  FormFieldComponent(
                                    name: "Fullname",
                                    // placeholder: "John doe",
                                    controller: fullnameC,
                                    validation: validateInput,
                                    isDisable: false,
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  FormFieldComponent(
                                    name: "Username",
                                    // placeholder: "johndoe22",
                                    controller: usernameC,
                                    validation: validateInput,
                                    isDisable: true,
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
