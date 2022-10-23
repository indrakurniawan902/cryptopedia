import 'dart:convert';

import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/screen/components/snackbar.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isDisable = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController fullnameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(Duration.zero, () {
      ScaffoldMessenger.of(context).showSnackBar(registSnackBar);
    });
    _checkRegisteredUser();
    emailC.text = widget.userEmail!;
    print(widget.userEmail!);
  }

  Future<void> _checkRegisteredUser() async {
    try {
      var res = await http.get(Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.checkRegister}?email=${widget.userEmail}"));
      if (res.statusCode == 200) {
        var dataResponse = jsonDecode(res.body);
        var data = dataResponse;
        print(dataResponse == 0);
        //tambahin kondisi semisal dataResponse nya == 1 dia otomatis dipindah ke halaman home (karene udah registrasi)

      } else {
        print("Error");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> _postRegister() async {
    try {
      var res = await http.post(Uri.parse(
          "${ApiConstants.baseUrl}${ApiConstants.register}?email=${emailC.text}&name=${fullnameC.text}&username=${usernameC.text}"));
      if (res.statusCode == 200) {
        var dataResponse = jsonDecode(res.body);
        var data = dataResponse;
        print(dataResponse);
        //tambahin kondisi semisal dataResponse nyaada dan ga error dia pindah dan munculin registrasi berhasil)

      } else {
        print("Error");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final auth = Provider.of<AuthProvider>(context, listen: false);
    User? user = auth.getUser();

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
                                name: "Email",
                                placeholder: widget.userEmail!,
                                controller: emailC,
                                initialValue: widget.userEmail,
                                validation: () {},
                                isDisable: true,
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
                        SizedBox(
                          height: 32.h,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonComponent(
                              text: "Save",
                              onClickFunction: () {
                                if (formKey.currentState!.validate()) {
                                  _postRegister();
                                }
                              },
                              isDisable: false),
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
