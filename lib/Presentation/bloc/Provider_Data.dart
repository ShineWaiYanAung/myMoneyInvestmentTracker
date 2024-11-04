import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../DataBase/HiveDataBase/Domain/CryptoEntity/cryptoModel.dart';

class ProviderData extends ChangeNotifier {
  List<CryptoModel> cryptoInvestedData = [];

  void insertingData(CryptoModel cryptoData) {
    cryptoInvestedData.add(cryptoData);
    notifyListeners();
  }

  void deletingData(CryptoModel cryptoData) {
    cryptoInvestedData.remove(cryptoData);
    notifyListeners();
  }

  void showSnackBar(BuildContext context, String text, bool isGreen) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: isGreen ? Colors.green : Colors.red,
        content: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        duration: Duration(seconds: 5), // Adjust duration as needed
      ),
    );
  }

}
