import 'package:hive/hive.dart';
import 'package:money_investment_track/DataBase/HiveDataBase/Domain/Crypto/crypto.dart';
import 'package:money_investment_track/DataBase/HiveDataBase/Domain/LoginName/user_name.dart';

class BoxesUsername {
  static Box<UserName> getUserNameData() => Hive.box<UserName>("UserName");
}
