import 'package:cryptopedia/model/user/api/user_api.dart';
import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/pop_up_dialog.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController _fullnameC = TextEditingController();
void validateInput() {
  if (_fullnameC.text != "") {}
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbar(
          size: 65,
          title: 'Edit Profile',
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
                  key: _formKey,
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
                                      validation: () {},
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
                                      placeholder: value.users.name,
                                      controller: _fullnameC,
                                      validation: validateInput,
                                      isDisable: false,
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
                                      validation: validateInput,
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
                            child: Consumer<UserProvider>(
                              builder: (context, value, child) =>
                                  ButtonComponent(
                                      text: "Save",
                                      onClickFunction: () async {
                                        if (_formKey.currentState!.validate()) {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const PopUpDialog(
                                                type: 'success',
                                                title: 'Success!',
                                                description: 'Profile Changed',
                                              );
                                            },
                                          );
                                          await UserApi.putUserDetail(
                                            value.users.username,
                                            value.users.email,
                                            _fullnameC.text,
                                          );
                                          Future.delayed(
                                            const Duration(seconds: 2),
                                            () => Navigator
                                                .pushNamedAndRemoveUntil(
                                                    context,
                                                    '/navbar',
                                                    (route) => false),
                                          );
                                        }
                                      },
                                      isDisable: false),
                            ),
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
