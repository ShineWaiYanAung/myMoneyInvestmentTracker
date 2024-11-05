import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../DataBase/HiveDataBase/Domain/CryptoEntity/cryptoModel.dart';
import '../../DataBase/HiveDataBase/Domain/CurrencyModel/currency_model.dart';

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
  void insertingCurrencyDataAtCrypto(
      String cryptoName, CurrencyInvestmentDataModel currencyData) {
    // Find the Crypto instance that matches the cryptoName
    for (var crypto in cryptoInvestedData) {
      print("THis is Fist  Name ${crypto.cryptoName}");
      print("THis is Second  Name ${cryptoName}");

      if (crypto.cryptoName.toLowerCase() == cryptoName.toLowerCase()) {
        // If found, add the currency data to its investment list
        crypto.currencyInvestmentData?.add(currencyData);

        // Print detailed information about the inserted currency data
        print("Inserted currency data:");
        print("  Currency Name: ${currencyData.investmentCurrencyName}");
        print("  Currency Quantity: ${currencyData.investmentCurrencyQuantity}");
        print("  Currency Price: ${currencyData.investmentCurrencyPriceRate}");
        print("  Total Investment Price: ${currencyData.investmentTotalPrice}");
        print("  Investment Date: ${currencyData.investmentCurrencyDatTime}");
        print("  Myanamr Rate is ${currencyData.myanmarDollarRate}");

        // Print the updated details of the Crypto
        print("Updated Crypto: ${crypto.cryptoName}");
        print("  Image Path: ${crypto.cryptoImage.path}");
        print("  Total Currency Investments: ${crypto.currencyInvestmentData?.length}");

        // Optionally, print out all the currency investments for this crypto
        print("  Current Investments:");
        for (var investment in crypto.currencyInvestmentData ?? []) {
          print("    ${investment.investmentCurrencyName}: ${investment.investmentCurrencyQuantity} @ ${investment.investmentCurrencyPriceRate} each, Total: ${investment.investmentTotalPrice}");
        }

        notifyListeners();
        return; // Exit after updating the first match
      }
    }

    // Optionally, you could handle the case where no matching crypto is found
    print("No crypto found with the name: $cryptoName");

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
