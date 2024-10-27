import '../CurrencyData/currency_data.dart';

class CurrencyInvestmentDataModel extends CurrencyInvestmentData {
  CurrencyInvestmentDataModel(
      {required super.investmentId,
      required super.investmentCurrencyName,
      required super.investmentCurrencyQuantity,
      required super.investmentCurrencyPrice,
      required super.investmentCurrencyDatTime,
      required super.investmentTotalPrice});
}
