import 'dart:convert';

import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/crypto_category.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../provider/auth_provider.dart';
import '../../utils/constant/api_constant.dart';
import '../../utils/constant/app_shadow.dart';
import '../../utils/constant/app_text_style.dart';
import '../components/button_component.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String category = cryptoCategory.first;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController titleC = TextEditingController();
    TextEditingController categoryC = TextEditingController();
    TextEditingController contentC = TextEditingController();
    TextEditingController tagC = TextEditingController();
    AuthProvider auth = Provider.of<AuthProvider>(context);
    User? user = auth.getUser();

    Future<void> _postForum(
        BuildContext context, VoidCallback onSuccess) async {
      try {
        var res = await http.post(
          Uri.parse("${ApiConstants.baseUrl}${ApiConstants.addPost}"),
          body: {
            'email': user?.email,
            'title': titleC.text,
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
        }
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.primaryBrand,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      "Add Forum",
                      textAlign: TextAlign.center,
                      style: headerStyleWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 24.h),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 20.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
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
                                      Text(
                                        "Category",
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      DropdownButtonFormField(
                                        value: category,
                                        style: TextStyle(
                                          color: AppColors.darkColor,
                                          fontFamily: "Poppins",
                                        ),
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                            fontSize: 14.sp,
                                          ),
                                          prefix: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.w)),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.h),
                                          fillColor: const Color(0xffFFFFFF),
                                          filled: true,
                                          hintText:
                                              "Select your forum category",
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.primaryBrand,
                                                width: 1.0),
                                          ),
                                          hintStyle:
                                              TextStyle(color: AppColors.gray4),
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
                                    placeholder: "Enter the forum content here",
                                    validation: () {},
                                    controller: contentC,
                                    isDisable: false,
                                    height: 4,
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  FormFieldComponent(
                                    name: "Tag",
                                    placeholder: "Forum tags, seperate with ,",
                                    validation: () {},
                                    controller: tagC,
                                    isDisable: false,
                                    height: 1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ButtonComponent(
                                  text: "Post",
                                  onClickFunction: () {
                                    if (formKey.currentState!.validate()) {
                                      _postForum(context, () {
                                        // Navigator.popAndPushNamed(
                                        //     context, "/register-success");
                                      });
                                    }
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
      ),
    );
  }
}