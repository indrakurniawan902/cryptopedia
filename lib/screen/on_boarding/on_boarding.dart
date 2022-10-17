import 'package:cryptopedia/provider/on_boarding_provider.dart';
import 'package:flutter/material.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:provider/provider.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    final onBoard = Provider.of<OnBoardingProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            value.getOnBoard[index].titleBold!,
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.bold),
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
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
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
      ),
    );
  }
}
