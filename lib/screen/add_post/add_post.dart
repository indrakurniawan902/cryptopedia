import 'dart:convert';

import 'package:cryptopedia/main.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/crypto_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../provider/theme_provider.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/app_shadow.dart';
import '../../utils/constant/app_text_style.dart';
import '../components/button_component.dart';
import '../components/default_appbar.dart';
import '../components/pop_up_dialog.dart';
// ignore: unused_import
import '../components/snackbar.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String category = cryptoCategory.first;
  TextEditingController titleC = TextEditingController();
  TextEditingController categoryC = TextEditingController();
  TextEditingController contentC = TextEditingController();
  TextEditingController tagC = TextEditingController();
  bool isFetching = false;

  @override
  Widget build(BuildContext buildContext) {
    final formKey = GlobalKey<FormState>();

    AuthProvider auth = Provider.of<AuthProvider>(context);

    Future<void> _postForum(
        BuildContext context, VoidCallback onSuccess, String email) async {
      try {
        var res = await http.post(
          Uri.parse("${ApiConstants.baseUrl}${ApiConstants.addPost}"),
          body: {
            'email': email,
            'title': titleC.text,
            'content': contentC.text,
            'category': category,
            'tags': tagC.text,
          },
        );
        if (res.statusCode == 200) {
          var dataResponse = jsonDecode(res.body);
          print(dataResponse);
          if (dataResponse != null) {
            onSuccess.call();
          }
        } else {
          print(res.statusCode);
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      appBar: const DefaultAppbar(
        size: 65,
        title: 'Add Post',
        fontSize: 24,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                    FormFieldComponent(
                                      name: "Title",
                                      placeholder: "Enter the forum title",
                                      validation: () {},
                                      controller: titleC,
                                      isDisable: false,
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Category",
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                        DropdownButtonFormField(
                                          value: category,
                                          style: TextStyle(
                                            color: value.themeValue == false
                                                ? AppColors.darkModeFrame
                                                : AppColors.lightColor,
                                            fontFamily: "Poppins",
                                          ),
                                          decoration: InputDecoration(
                                            errorStyle: TextStyle(
                                              fontSize: 14.sp,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: value.themeValue ==
                                                          false
                                                      ? AppColors.gray4
                                                      : AppColors.darkModeFrame,
                                                  width: 1.0),
                                            ),
                                            prefix: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 16.w)),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              vertical: 12.h,
                                            ),
                                            fillColor: value.themeValue == false
                                                ? AppColors.lightColor
                                                : AppColors.gray2,
                                            filled: true,
                                            hintText:
                                                "Select your forum category",
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: AppColors.primaryBrand,
                                                  width: 1.0),
                                            ),
                                            hintStyle: const TextStyle(
                                                color: AppColors.gray4),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          items: cryptoCategory
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (String? value) {
                                            // This is called when the user selects an item.
                                            setState(() {
                                              category = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    FormFieldComponent(
                                      name: "Content",
                                      placeholder:
                                          "Enter the forum content here",
                                      validation: () {},
                                      controller: contentC,
                                      isDisable: false,
                                      height: 4,
                                      maxLines: 4,
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    FormFieldComponent(
                                      name: "Tag",
                                      placeholder:
                                          "Forum tags, seperate with ,",
                                      validation: () {},
                                      controller: tagC,
                                      isDisable: false,
                                      height: 1,
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
                              child: StreamBuilder<User?>(
                                stream: auth.changeState(),
                                builder: (context, snapshot) {
                                  return ButtonComponent(
                                      text: "Post",
                                      isLoading: isFetching,
                                      onClickFunction: () {
                                        if (formKey.currentState!.validate()) {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback(
                                            (_) => setState(
                                              () {
                                                isFetching = true;
                                              },
                                            ),
                                          );
                                          _postForum(buildContext, () {
                                            Navigator.of(buildContext)
                                                .popAndPushNamed("/navbar");
                                            showDialog(
                                              context:
                                                  navigatorKey.currentContext!,
                                              builder: (BuildContext context) {
                                                return const PopUpDialog(
                                                  type: 'success',
                                                  title: 'Success!',
                                                  description:
                                                      'Your forum has been posted!',
                                                );
                                              },
                                            );
                                          }, snapshot.data!.email!);
                                        }
                                      },
                                      isDisable:
                                          snapshot.hasData ? false : true);
                                },
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
      ),
    );
  }
}
