import 'package:hive/hive.dart';
import 'package:money_investment_track/DataBase/HiveDataBase/Domain/Crypto/crypto.dart';

class Boxes {
  static Box<Crypto> getCryptoData() => Hive.box<Crypto>("CryptoData");
}
