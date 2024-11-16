import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_investment_track/DataBase/HiveDataBase/Domain/LoginName/boxes_username.dart';
import 'package:money_investment_track/DataBase/HiveDataBase/Domain/LoginName/user_name.dart';
import '../../DataBase/HiveDataBase/Box/box.dart';
import '../../DataBase/HiveDataBase/Domain/Crypto/crypto.dart';
import '../../DataBase/HiveDataBase/Domain/CurrencyData/currency_data.dart';

class ProviderData extends ChangeNotifier {
  List<Crypto> cryptoInvestedData = [];
  bool isShow = true;
  String? _name;
  File? _profile;
  String? get name => _name;
  File? get profile => _profile;


  ///change the Nav
  void removeOrAddNav(){
    isShow = !isShow;
    notifyListeners();
    print("NAV STATE $isShow");
  }

  final box = Boxes.getCryptoData();

  final userNameBox = BoxesUsername.getUserNameData();

  Future<void> addOrUpdateNameData(UserName name) async {
    print("addOrUpdateNameData called with name: ${name.profileImage}");

    if (userNameBox.isNotEmpty) {
      // If a username exists, update it instead of adding a new one
      final existingUserName = userNameBox.values.first;
      final existingImage = existingUserName.profileImage;
      print("Existing username found: ${existingUserName.name}, deleting it...");
      await existingUserName.delete();
    }

    // Add the new username
    await userNameBox.add(name);
    _name = name.name;
    _profile = name.profileImage;
    print("New username added: ${name.name}");
    if(_profile ==null){
      print("There is no image");
    }
    else
      {
        print("There is a Image");
      }
    // Load the name data again after adding it
    await loadNameData(); // Ensure we load the newly added data

    notifyListeners();
  }
  void deleteProfileImageAndName(UserName profile) async {
    if (userNameBox.isNotEmpty) {
      // Check if there is a profile image
      if (profile.profileImage != null) {
        final file = profile.profileImage!;
        if (await file.exists()) {
          print("Deleting image at path: ${file.path}");
          await file.delete();
        } else {
          print("Image file not found at path: ${file.path}");
        }
      } else {
        print("No profile image found, only the username will be deleted.");
      }

      // Delete the user data from the Hive box
      print("Deleting username: ${profile.name}");
      await profile.delete();

      print("Profile and associated image (if present) have been deleted.");
    } else {
      print("No profiles found to delete.");
    }
  }

  Future<void> loadNameData() async {
    print("Loading name data...");

    if (userNameBox.isNotEmpty) {
      _name = userNameBox.values.first.name;
      _profile = userNameBox.values.first.profileImage;
      print("Loaded name: $_name");
    } else {
      print("No username found in Hive");
    }

    notifyListeners();
  }


  Future<void> loadCryptoData() async{
    cryptoInvestedData = [];
    if(box.isNotEmpty){
      cryptoInvestedData = box.values.toList();
      print("Data are Coming");
      notifyListeners();
    }
    else{
      print("Sadly there has no data");
    }
  }
  void insertingData(Crypto cryptoData) {
    cryptoInvestedData.add(cryptoData);
    box.add(cryptoData);
    notifyListeners();
  }

  void deletingData(Crypto cryptoData) {
    cryptoInvestedData.remove(cryptoData);
    cryptoData.delete();
    notifyListeners();
  }
  Future<void> insertingCurrencyDataAtCrypto(
      String cryptoName, CurrencyInvestmentData currencyData) async {

    // Find the Crypto instance that matches the cryptoName
    for (var crypto in cryptoInvestedData) {
      if (crypto.cryptoName.toLowerCase() == cryptoName.toLowerCase()) {
        // If found, add the currency data to its investment list
        crypto.currencyInvestmentData?.add(currencyData);

        // Update the Crypto object in the Hive box to persist the changes
        await crypto.save();

        // Notify listeners to update UI
        notifyListeners();
        return; // Exit after updating the first match
      }
    }

    // Handle the case where no matching crypto is found
    print("No crypto found with the name: $cryptoName");
  }


  void deletingCurrencyDataAtCrypto(
      String cryptoName, CurrencyInvestmentData currencyData) {
    // Find the Crypto instance that matches the cryptoName
    for (var crypto in cryptoInvestedData) {

      if (crypto.cryptoName.toLowerCase() == cryptoName.toLowerCase()) {
        crypto.currencyInvestmentData?.remove(currencyData);
        crypto.save();
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
