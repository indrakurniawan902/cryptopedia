import 'dart:convert';

// ignore: unused_import
import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/snackbar.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/constant/app_shadow.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({Key? key, required this.userEmail}) : super(key: key);
  final String? userEmail;

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController fullnameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(registSnackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    void validateInput() {
      if (fullnameC.text != "" && usernameC.text != "") {}
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Complete Your",
                      style: headerStyleBlack,
                    ),
                    Text(
                      "Registration",
                      style: headerStyleGreen,
                    ),
                    SizedBox(height: 40.h),
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
                                Consumer<AuthProvider>(
                                  builder: (context, value, child) =>
                                      FormFieldComponent(
                                    name: "Email",
                                    initialValue: value.getUser()!.email!,
                                    validation: () {},
                                    isDisable: true,
                                  ),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                FormFieldComponent(
                                  name: "Fullname",
                                  placeholder: "John doe",
                                  controller: fullnameC,
                                  validation: validateInput,
                                  isDisable: false,
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                FormFieldComponent(
                                  name: "Username",
                                  placeholder: "johndoe22",
                                  controller: usernameC,
                                  validation: validateInput,
                                  isDisable: false,
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
                          child: Consumer<AuthProvider>(
                            builder: (context, value, child) => ButtonComponent(
                                text: "Save",
                                onClickFunction: () {
                                  if (formKey.currentState!.validate()) {
                                    value.postRegister(
                                        context,
                                        () => Navigator.popAndPushNamed(
                                            context, "/register-success"),
                                        value.getUser()!.email!,
                                        fullnameC.text,
                                        usernameC.text);
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
            ),
          ),
        ),
      ),
    );
  }
}
