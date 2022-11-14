import 'package:cryptopedia/screen/navbar/navbar.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegistrationSuccess extends StatefulWidget {
  const RegistrationSuccess({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccess> createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(context, _createRoute(), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
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

Route _createRoute() {
  return PageRouteBuilder(
      transitionDuration: const Duration(seconds: 2),
      pageBuilder: (context, animation, secondaryAnimation) => const Navbar(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(begin: 0.0, end: 1.0);
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      });
}
