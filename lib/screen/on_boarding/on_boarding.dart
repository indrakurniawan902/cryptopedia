import 'package:cryptopedia/provider/on_boarding_provider.dart';
import 'package:cryptopedia/screen/components/button_component.dart';
import 'package:flutter/material.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

int _pageIndex = 0;

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    final onBoard = Provider.of<OnBoardingProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 72.h,
                    ),
                    Consumer<OnBoardingProvider>(
                        builder: (context, value, child) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Image.asset(
                              value.getOnBoard[index].image!,
                              height: 316.h,
                              width: 316.w,
                            ))),
                    SizedBox(
                      height: 20.h,
                    ),
                    Consumer<OnBoardingProvider>(
                        builder: (context, value, child) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.getOnBoard[index].titleBold!,
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontFamily: 'Poppins-Bold',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      value.getOnBoard[index].title1!,
                                      style: TextStyle(
                                          fontSize: 24.sp,
                                          fontFamily: 'Poppins'),
                                    ),
                                  ],
                                ),
                                value.getOnBoard[index].title2 != null
                                    ? Text(
                                        value.getOnBoard[index].title2!,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            fontFamily: 'Poppins'),
                                      )
                                    : const SizedBox()
                              ],
                            ))),
                    SizedBox(
                      height: 12.h,
                    ),
                    Consumer<OnBoardingProvider>(
                        builder: (context, value, child) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 24.w),
                            child: Text(
                              value.getOnBoard[index].description!,
                              style: TextStyle(
                                  fontSize: 13.sp, fontFamily: 'Poppins'),
                            ))),
                  ],
                );
              },
              itemCount: onBoard.getOnBoard.length,
            ),
            Align(
              alignment: Alignment(0.w, 0.68.h),
              child: Consumer<OnBoardingProvider>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      value.getOnBoard.length,
                      (index) => DotIndicator(
                            isActive: index == _pageIndex,
                          )),
                ),
              ),
            ),
            _pageIndex == 2
                ? Align(
                    alignment: Alignment(0.w, 0.85.h),
                    child: SizedBox(
                      width: 327.w,
                      height: 46.h,
                      child: ButtonComponent(
                          text: 'Continue With Google',
                          onClickFunction: () {},
                          isDisable: false),
                    ))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = true}) : super(key: key);
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryBrand : const Color(0xffCCCCCC),
        shape: BoxShape.circle,
      ),
    );
  }
}
