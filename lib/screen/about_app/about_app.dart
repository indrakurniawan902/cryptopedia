import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/screen/components/default_appbar.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:cryptopedia/utils/constant/app_shadow.dart';
import 'package:cryptopedia/utils/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const DefaultAppbar(
          size: 65,
          title: 'About App',
          isBack: true,
          fontSize: 24,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Center(
                child: SizedBox(
                  height: 135..h,
                  width: 173.w,
                  child: Image.asset(
                    'assets/images/launch.png',
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Consumer<ThemeProvider>(
                builder: (context, value, child) => Container(
                  height: 240.h,
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      AppShadow.shadow1,
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: value.themeValue == false
                        ? AppColors.lightColor
                        : AppColors.darkModeFrame,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque.',
                    style: aboutText,
                  ),
                ),
              ),
              SizedBox(
                height: 222.h,
              ),
              Text(
                '© 2022 cryptopedia',
                textAlign: TextAlign.center,
                style: copyRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
