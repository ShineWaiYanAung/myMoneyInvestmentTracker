import 'package:money_investment_track/DataBase/HiveDataBase/Domain/Crypto/crypto.dart';

class CryptoModel extends Crypto {
  CryptoModel({
    required super.cryptoName,
    super.currencyInvestmentData, required super.cryptoImage,
  });
}
