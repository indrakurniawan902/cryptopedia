import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:cryptopedia/screen/components/form_field_component.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
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
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
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
                              const SizedBox(
                                height: 12,
                              ),
                              FormFieldComponent(
                                name: "Fullname",
                                placeholder: "John doe",
                                controller: fullnameC,
                                validation: validateInput,
                                isDisable: false,
                              ),
                              const SizedBox(
                                height: 12,
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
                        const SizedBox(
                          height: 32,
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
