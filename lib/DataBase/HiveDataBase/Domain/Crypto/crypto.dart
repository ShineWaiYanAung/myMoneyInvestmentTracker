
import 'dart:io';

import '../CurrencyModel/currency_model.dart';

class Crypto {
  final String cryptoName;
  final File cryptoImage;
  final List<CurrencyInvestmentDataModel>? currencyInvestmentData;
  Crypto({ required this.cryptoImage,required this.cryptoName, this.currencyInvestmentData});
}
