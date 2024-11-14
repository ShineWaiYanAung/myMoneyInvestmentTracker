import 'package:hive/hive.dart';
part 'currency_data.g.dart';

@HiveType(typeId: 2)
class CurrencyInvestmentData {
  @HiveField(11)
  final int investmentId;
  @HiveField(12)
  final String investmentCurrencyName;
  @HiveField(13)
  final double investmentCurrencyQuantity;
  @HiveField(14)
  final double investmentCurrencyPriceRate;
  @HiveField(15)
  final DateTime investmentCurrencyDatTime;
  @HiveField(16)
  final double myanmarDollarRate;
  @HiveField(17)
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
