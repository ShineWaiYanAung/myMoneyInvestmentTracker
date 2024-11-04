import 'package:flutter/cupertino.dart';
import '../../DataBase/HiveDataBase/Domain/CryptoEntity/cryptoModel.dart';

class ProviderData extends ChangeNotifier{
  List<CryptoModel>  data = [];



  void insertingData(CryptoModel cryptoData){
    data.add(cryptoData);
  }
}