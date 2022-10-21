import 'package:cryptopedia/screen/components/ButtonComponent.dart';
import 'package:cryptopedia/screen/components/FormFieldComponent.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

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
    final _formKey = GlobalKey<FormState>();

    void _validateInput() {
      if (fullnameC.text != "" && usernameC.text != "") {}
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Complete Your",
                      style: TextStyle(fontSize: 28),
                    ),
                    Text(
                      "Registration",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryBrand),
                    ),
                    SizedBox(height: 40),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              FormFieldComponent(
                                name: "Email",
                                placeholder: "johndoe@gmail.com",
                                controller: emailC,
                                validation: _validateInput,
                                isDisable: true,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              FormFieldComponent(
                                name: "Fullname",
                                placeholder: "John doe",
                                controller: fullnameC,
                                validation: _validateInput,
                                isDisable: false,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              FormFieldComponent(
                                name: "Username",
                                placeholder: "johndoe22",
                                controller: usernameC,
                                validation: _validateInput,
                                isDisable: false,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonComponent(
                              text: "Save",
                              onClickFunction: () {
                                if (_formKey.currentState!.validate()) {}
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
