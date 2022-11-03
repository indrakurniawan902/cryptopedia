import 'package:cryptopedia/model/on_boarding/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  final List<OnBoardingModel> _onboard = [
    OnBoardingModel(
        description:
            'Peer to Peer Crypto Learning Platform that can help a problem when many traders are struggling yet none can answer their need, but our users can do that with Crypto Sharing and Crypto 101.',
        title2: 'with Us',
        title1: 'are Learning ',
        titleBold: '100+ Users ',
        image: 'assets/images/on_board_img1.png'),
    OnBoardingModel(
        description:
            'Our materials and peer-to-peer learning\n focused only in crypto materials, so you can easily find any materials related to crypto here!',
        title1: 'Focused',
        titleBold: 'Crypto ',
        image: 'assets/images/on_board_img2.png'),
    OnBoardingModel(
        description:
            'Get more insight by using our peer-to-peer learning platform. You can also find the crypto 101 if you are newbie in cryptocurrency.',
        titleBold: 'More insight',
        title1: '',
        image: 'assets/images/on_board_img3.png'),
  ];

  List<OnBoardingModel> get getOnBoard => _onboard;
}
