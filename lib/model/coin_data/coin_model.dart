class CoinModel {
  String? name;
  String? image;
  String? symbol;
  // ignore: prefer_typing_uninitialized_variables
  var currentPrice;
  double? priceChangePercentage24h;
  double? marketCapChangePercentage24h;

  CoinModel({
    this.name,
    this.image,
    this.symbol,
    this.currentPrice,
    this.priceChangePercentage24h,
    this.marketCapChangePercentage24h,
  });
}
