class CurrencyInvestmentData {
  final int investmentId;
  final String investmentCurrencyName;
  final double investmentCurrencyQuantity;
  final double investmentCurrencyPriceRate;
  final DateTime investmentCurrencyDatTime;
  final double myanmarDollarRate;
  final double investmentTotalPrice;

  CurrencyInvestmentData( {
    required this.investmentId,
    required this.investmentCurrencyName,
    required this.investmentCurrencyQuantity,
    required this.investmentCurrencyPriceRate,
    required this.myanmarDollarRate,
    required this.investmentCurrencyDatTime,
    required this.investmentTotalPrice,
  });
}
