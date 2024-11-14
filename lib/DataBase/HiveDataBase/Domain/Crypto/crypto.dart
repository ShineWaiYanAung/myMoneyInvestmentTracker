import 'dart:io';
import '../CurrencyData/currency_data.dart';
import 'package:hive/hive.dart';
part 'crypto.g.dart';

@HiveType(typeId: 1)

class Crypto extends HiveObject{
  @HiveField(0)
  final String cryptoName;

  @HiveField(1)
  final File cryptoImage;

  @HiveField(2)
  final List<CurrencyInvestmentData>? currencyInvestmentData;
  Crypto(
      {required this.cryptoImage,
      required this.cryptoName,
        List<CurrencyInvestmentData>? currencyInvestmentData,
      }) : currencyInvestmentData = currencyInvestmentData ?? []; // Initialize if null
}