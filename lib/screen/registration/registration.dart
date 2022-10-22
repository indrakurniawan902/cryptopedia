import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constant/app_shadow.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isDisable = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController fullnameC = TextEditingController();
  TextEditingController usernameC = TextEditingController();

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
                                placeholder: "johndoe@gmail.com",
                                controller: emailC,
                                validation: validateInput,
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
                                if (formKey.currentState!.validate()) {}
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
