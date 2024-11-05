class CurrencyInvestmentData {
  final int investmentId;
  final String investmentCurrencyName;
  final double investmentCurrencyQuantity;
  final double investmentCurrencyPrice;
  final DateTime investmentCurrencyDatTime;
  final double investmentTotalPrice;

  CurrencyInvestmentData({
    required this.investmentId,
    required this.investmentCurrencyName,
    required this.investmentCurrencyQuantity,
    required this.investmentCurrencyPrice,
    required this.investmentCurrencyDatTime,
    required this.investmentTotalPrice,
  });
}
