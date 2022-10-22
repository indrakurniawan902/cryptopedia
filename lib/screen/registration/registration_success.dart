import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationSuccess extends StatelessWidget {
  const RegistrationSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              'assets/images/top-cloud.png',
              width: double.infinity,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/bottom-cloud.png',
                width: double.infinity,
              ),
            ],
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your",
                          style: headerStyleBlack,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "Registation",
                          style: headerStyleGreen,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Text(
                      "Success",
                      style: headerStyleBlack,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Image.asset(
                      'assets/images/jump.png',
                      height: 324.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
