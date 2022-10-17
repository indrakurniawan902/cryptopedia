import 'package:cryptopedia/provider/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

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
                    Consumer<OnBoardingProvider>(
                        builder: (context, value, child) => Padding(
                            padding: const EdgeInsets.fromLTRB(30, 71, 30, 21),
                            child: Image.asset(
                              value.getOnBoard[index].image!,
                              height: 316,
                              width: 316,
                            ))),
                    Consumer<OnBoardingProvider>(
                        builder: (context, value, child) => Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                            child: Column(
                              children: [
                                value.getOnBoard[index].title2 == null
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            value.getOnBoard[index].titleBold!,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Poppins-Bold',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            value.getOnBoard[index].title1!,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                value.getOnBoard[index]
                                                    .titleBold!,
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: 'Poppins',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                value.getOnBoard[index].title1!,
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: 'Poppins'),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            value.getOnBoard[index].title2!,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Poppins'),
                                          ),
                                        ],
                                      ),
                              ],
                            ))),
                    Consumer<OnBoardingProvider>(
                        builder: (context, value, child) => Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                            child: Text(
                              value.getOnBoard[index].description!,
                              style: const TextStyle(
                                  fontSize: 14, fontFamily: 'Poppins'),
                            ))),
                  ],
                );
              },
              itemCount: onBoard.getOnBoard.length,
            ),
            Positioned(
              top: 640,
              left: 175,
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
                ? Positioned(
                    top: 734,
                    left: 24,
                    right: 24,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('data')))
                : const Text(''),
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
