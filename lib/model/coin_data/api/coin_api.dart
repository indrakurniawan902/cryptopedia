import 'package:cryptopedia/model/coin_data/coin_model.dart';
import 'package:cryptopedia/utils/constant/api_constant.dart';
import 'package:dio/dio.dart';

class CoinApi {
  static Future<List<CoinModel>> fethData() async {
    try {
      final response = await Dio().get(ApiConstants.getCoinData);
      if (response.statusCode == 200) {
        List<CoinModel> data = (response.data as List)
            .map((e) => CoinModel(
                  currentPrice: e['current_price'],
                  image: e['image'],
                  marketCapChangePercentage24h:
                      e['market_cap_change_percentage_24h'],
                  name: e['name'],
                  symbol: e['symbol'],
                  priceChangePercentage24h: e['price_change_percentage_24h'],
                ))
            .toList();
        return data;
      } else {
        throw Exception('Failed to load Data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
