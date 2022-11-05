import 'package:cryptopedia/model/coin_data/api/coin_api.dart';
import 'package:cryptopedia/model/coin_data/coin_model.dart';
import 'package:flutter/cupertino.dart';

class CoinProvider extends ChangeNotifier {
  List<CoinModel> _coinList = [];
  List<CoinModel> _coinListSortPrice = [];
  List<CoinModel> _coinListSortMarket = [];
  bool _isLoading = true;

  List<CoinModel> get getListCoin => _coinList;
  List<CoinModel> get getListCoinSortPrice => _coinListSortPrice;
  List<CoinModel> get getListCoinSortMarket => _coinListSortMarket;
  bool get loading => _isLoading;

  getAllCoin() async {
    try {
      _isLoading = true;
      final c = await CoinApi.fethData();
      _coinList = c;
      notifyListeners();
    } finally {
      _isLoading = false;
    }
  }

  coinSortPriceChange() async {
    try {
      _isLoading = true;
      final c = await CoinApi.fethData();
      c.sort(
        (a, b) {
          return a.priceChangePercentage24h!
              .compareTo(b.priceChangePercentage24h!);
        },
      );
      _coinListSortPrice = c;
      notifyListeners();
    } finally {
      _isLoading = false;
    }
  }

  coinSortMarketCap() async {
    try {
      _isLoading = true;
      final c = await CoinApi.fethData();
      c.sort(
        (a, b) {
          return a.marketCapChangePercentage24h!
              .compareTo(b.marketCapChangePercentage24h!);
        },
      );
      _coinListSortMarket = c;
      notifyListeners();
    } finally {
      _isLoading = false;
    }
  }
}
