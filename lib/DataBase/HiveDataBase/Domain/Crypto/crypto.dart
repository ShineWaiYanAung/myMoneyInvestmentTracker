
import '../CurrencyModel/currency_model.dart';

class Crypto {
  final String cryptoName;
  final List<CurrencyInvestmentDataModel>? currencyInvestmentData;
  Crypto({required this.cryptoName, this.currencyInvestmentData});
}
