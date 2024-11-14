import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/microSubPage/crypto_detail.dart';
import 'package:money_investment_track/Presentation/widgets/back_button.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../../../../DataBase/HiveDataBase/Domain/CurrencyData/currency_data.dart';
import '../../../../bloc/Provider_Data.dart';

class CurrencyDetailData extends StatefulWidget {
  final String cryptoName;
  final String currencyName;
  final String path;
  final File image;
  const CurrencyDetailData(
      {super.key,
        required this.currencyName,
        required this.path,
        required this.cryptoName, required this.image});

  @override
  State<CurrencyDetailData> createState() => _CurrencyDetailDataState();
}

class _CurrencyDetailDataState extends State<CurrencyDetailData> {
  final TextEditingController currencyQuantity = TextEditingController();
  final TextEditingController myanmarDollarRatePrice = TextEditingController();
  final TextEditingController currencyRate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<CurrencyInvestmentData> currencyModelList = [];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onPressed: () {
          showDataInserterDialog(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: BackButtonWidget(
                  isColorChange: true, currencyName: widget.currencyName, onNavigate: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => CryptoTypeDetail(cryptoName: widget.cryptoName, image: widget.image),
                  ),
                );
              },),
            ),
            SizedBox(
              width: width * 0.5,
              height: height * 0.24,
              child: Image.asset(
                widget.path,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.9,
              height: height * 0.07,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  IconButton(
                    ///Needed To Implement
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Text(
                    "Search....",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: "Jersey",
                        fontWeight: FontWeight.w100,
                        fontSize: 30,
                        letterSpacing: 2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 40, right: 40, left: 40),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(100),
                  ),
                ),
                child: Consumer<ProviderData>(
                  builder: (BuildContext context, ProviderData value,
                      Widget? child) {
                    final myDataList = value.cryptoInvestedData;
                    for (var crypto in myDataList) {
                      // Check if the cryptocurrency name matches
                      if (crypto.cryptoName == widget.cryptoName) {
                        // Check if there are any currency investments
                        if (crypto.currencyInvestmentData != null &&
                            crypto.currencyInvestmentData!.isNotEmpty) {
                          // Iterate through the list of investments
                          for (var currency in crypto.currencyInvestmentData!) {
                            // Check if the investment currency name matches
                            if (currency.investmentCurrencyName ==
                                widget.currencyName) {
                              // Add the matching investment to the list
                              currencyModelList.add(
                                  currency); // Correctly add the individual investment
                            }
                          }
                        }
                      }
                    }

                    return currencyModelList.isEmpty
                        ? Center(
                      child: Lottie.asset("lottieJson/emptyShow.json"),
                    )
                        : ListView.builder(
                        itemCount: currencyModelList.length,
                        itemBuilder: (context, index) {
                          ///AssigningTheData
                          final currencyEachData = currencyModelList[index];
                          int number = index + 1;
                          String formattedPrice = currencyEachData
                              .investmentTotalPrice >=
                              100000
                              ? "MMK ${(currencyEachData.investmentTotalPrice / 100000).toStringAsFixed(4)} Lakhs"
                              : "MMK ${currencyEachData.investmentTotalPrice.toStringAsFixed(2)}";
                          String formattedDate =
                          DateFormat("M/d/yyyy 'at' h:mm a 'on' E")
                              .format(currencyEachData
                              .investmentCurrencyDatTime);

                          double quantityStarOrTon = 0;
                          if(widget.currencyName.toLowerCase()=="star"){
                            double starConvert =  currencyEachData.investmentCurrencyQuantity / 0.003167;

                            quantityStarOrTon = starConvert;
                          }
                          else{
                            quantityStarOrTon = currencyEachData.investmentCurrencyQuantity;
                          }
                          String formattedStarQuantity = quantityStarOrTon >=1000 ?
                          "${(quantityStarOrTon/1000).toStringAsFixed(2)}K":
                          quantityStarOrTon.toStringAsFixed(0) ;

                          String formattedTonQuantity = quantityStarOrTon >=1000 ?
                          "${(quantityStarOrTon/1000).toStringAsFixed(2)}K":
                          quantityStarOrTon.toStringAsFixed(3) ;

                          ///////////////////////////////////////

                          return Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Card(
                              shadowColor: Color(0xff1C2242),
                              elevation: 6,
                              color: Colors.white,
                              child: ExpansionTile(
                                leading: CircleAvatar(
                                  backgroundColor:
                                  Theme.of(context).focusColor,
                                  child: Text(
                                    number.toString(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Row(
                                  children: [
                                    Text(
                                      currencyEachData
                                          .investmentCurrencyName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color:
                                          Theme.of(context).focusColor),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(
                                      widget.currencyName.toLowerCase()=='star'? formattedStarQuantity :formattedTonQuantity,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color:
                                          Theme.of(context).focusColor),
                                    )
                                  ],
                                ),
                                subtitle: Text(
                                  "$formattedPrice",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.w500),
                                ),
                                trailing: IconButton(
                                  ///Need To Do
                                  onPressed: () {
                                    ProviderData myProviderKey = context.read<ProviderData>();
                                    myProviderKey.deletingCurrencyDataAtCrypto(
                                        widget.cryptoName, currencyEachData
                                    );
                                    setState(() {

                                    });
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Text(
                                        "Myanmar Dollar Rate ${currencyEachData.myanmarDollarRate.toString()}  MMK",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).focusColor),
                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        "TON Rate ${currencyEachData.investmentCurrencyPriceRate.toString()}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).focusColor),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        formattedDate,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blueAccent),
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDataInserterDialog(BuildContext context) {
    String? currencyQuantityError;
    String? currencyPriceRateError;
    String? myanmarRateError;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(30),
              backgroundColor: Theme.of(context).focusColor,
              title: Center(
                child: Text(
                  "Enter Your ${widget.currencyName}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Jersey",
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  SizedBox(height: 20),
                  // Currency Quantity Field
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true), // Allow decimal numbers
                    controller: currencyQuantity,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Currency Quantity',
                      hintStyle: TextStyle(color: Colors.white54),
                      errorText: currencyQuantityError,
                    ),
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        currencyQuantityError = null;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Currency Rate Field
                  TextField(
                    controller: currencyRate,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Currency Rate',
                      hintStyle: TextStyle(color: Colors.white54),
                      errorText: currencyPriceRateError,
                    ),
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        currencyPriceRateError = null;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  // Myanmar Dollar Rate Field
                  TextField(
                    controller: myanmarDollarRatePrice,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                      ),
                      hintText: 'Myanmar Dollar Rate',
                      hintStyle: TextStyle(color: Colors.white54),
                      errorText: myanmarRateError,
                    ),
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        myanmarRateError = null;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                  Divider(
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    // Reset error messages
                    currencyPriceRateError = null;
                    myanmarRateError = null;
                    currencyQuantityError = null;

                    final String name = widget.currencyName;
                    final String myanmarRateStr = myanmarDollarRatePrice.text.trim();
                    final String priceStr = currencyRate.text.trim();
                    final String quantityStr = currencyQuantity.text.trim();

                    // Validate all fields and set errors
                    if (myanmarRateStr.isEmpty || double.tryParse(myanmarRateStr) == null) {
                      myanmarRateError = "Please enter a valid price.";
                    }
                    if (priceStr.isEmpty || double.tryParse(priceStr) == null) {
                      currencyPriceRateError = "Please enter a valid price.";
                    }
                    if (quantityStr.isEmpty || double.tryParse(quantityStr) == null) {
                      currencyQuantityError = "Please enter a valid quantity.";
                    }

                    // If any error exists, setState to update the UI
                    if (myanmarRateError != null ||
                        currencyPriceRateError != null ||
                        currencyQuantityError != null) {
                      setState(() {
                        // Trigger UI update
                      });
                      return; // Stop further processing if errors exist
                    }

                    // Processing All Data
                    double finalQuantity = 0.0;
                    double price = double.parse(priceStr);
                    if(widget.currencyName.toLowerCase() =="star"){
                      double starQuantity = double.parse(quantityStr);
                      double starConversion = 0.003167 *starQuantity;
                      finalQuantity = starConversion;
                    }
                    else{
                      finalQuantity = double.parse(quantityStr);
                    }
                    double myanmarRate = double.parse(myanmarRateStr);
                    double tonInDollar = (price + 0.02) * finalQuantity;
                    double totalPrice = (tonInDollar * myanmarRate);

                    // Create CurrencyInvestmentDataModel object
                    CurrencyInvestmentData currencyDataModel = CurrencyInvestmentData(
                      investmentId: 0, // Set appropriate value for index
                      investmentCurrencyName: name,
                      investmentCurrencyQuantity: finalQuantity,
                      investmentCurrencyDatTime: DateTime.now(),
                      investmentTotalPrice: totalPrice,
                      investmentCurrencyPriceRate: price,
                      myanmarDollarRate: myanmarRate,
                    );

                    // Call provider to insert data
                    ProviderData myProviderKey = context.read<ProviderData>();
                    myProviderKey.insertingCurrencyDataAtCrypto(
                        widget.cryptoName, currencyDataModel
                    );

                    // Clear fields and close the dialog
                    currencyQuantity.clear();
                    myanmarDollarRatePrice.clear();
                    currencyRate.clear();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontSize: 16,
                        fontFamily: "Jersey",
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Reset and close the dialog
                    currencyQuantity.clear();
                    myanmarDollarRatePrice.clear();
                    currencyRate.clear();
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Text(
                      "Close",
                      style: TextStyle(
                        color: Theme.of(context).focusColor,
                        fontSize: 16,
                        fontFamily: "Jersey",
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

}
