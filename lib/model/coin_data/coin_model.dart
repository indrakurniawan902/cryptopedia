class CoinModel {
  String? name;
  String? image;
  String? symbol;
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
