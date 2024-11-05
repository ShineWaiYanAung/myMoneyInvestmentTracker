import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/chart_widget.dart';
import 'package:money_investment_track/Presentation/widgets/back_button.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';
import '../../../../../DataBase/HiveDataBase/Domain/CurrencyModel/currency_model.dart';
import '../../../../bloc/Provider_Data.dart';

class CurrencyDetailData extends StatefulWidget {
  final String cryptoName;
  final String currencyName;
  final String path;
  const CurrencyDetailData(
      {super.key, required this.currencyName, required this.path, required this.cryptoName});

  @override
  State<CurrencyDetailData> createState() => _CurrencyDetailDataState();
}

class _CurrencyDetailDataState extends State<CurrencyDetailData> {
  final TextEditingController currencyName = TextEditingController();
  final TextEditingController currencyQuantity = TextEditingController();
  final TextEditingController currencyPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    List<CurrencyInvestmentDataModel> currencyModelList = [];

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
                  isColorChange: true, currencyName: widget.currencyName),
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
                        if (crypto.currencyInvestmentData != null && crypto.currencyInvestmentData!.isNotEmpty) {
                          // Iterate through the list of investments
                          for (var currency in crypto.currencyInvestmentData!) {
                            // Check if the investment currency name matches
                            if (currency.investmentCurrencyName == widget.currencyName) {
                              // Add the matching investment to the list
                              currencyModelList.add(currency); // Correctly add the individual investment
                            }
                          }
                        }
                      }
                    }




                    return
                      currencyModelList.isEmpty ? Center(
                        child: Lottie.asset("lottieJson/emptyShow.json"),
                      ) :
                      ListView.builder(
                          itemCount: currencyModelList.length,
                          itemBuilder: (context, index) {
                      final currencyEachData = currencyModelList[index];
                      int number = index +1;
                      return
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Card(
                          shadowColor: Color(0xff1C2242),
                          elevation: 6,
                          color: Colors.white,
                          child: ListTile(
                            onTap: () {},
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            leading: CircleAvatar(
                              backgroundColor: Theme.of(context).focusColor,
                              child: Text(
                                number.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  currencyEachData.investmentCurrencyName,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).focusColor),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  currencyEachData.investmentCurrencyQuantity.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).focusColor),
                                )
                              ],
                            ),
                            subtitle: Text(
                              "MMK ${currencyEachData.investmentCurrencyPrice}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: IconButton(

                              ///Need To Do
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
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
    String? currencyNameError;
    String? currencyPriceError;
    String? currencyQuantityError;

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
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: currencyName,
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
                      hintText: 'Currency Name',
                      hintStyle: TextStyle(color: Colors.white54),
                      errorText: currencyNameError,
                    ),
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        currencyNameError = null;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: currencyPrice,
                    keyboardType: TextInputType.number,
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
                      hintText: 'Currency Price',
                      hintStyle: TextStyle(color: Colors.white54),
                      errorText: currencyPriceError,
                    ),
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        currencyPriceError = null;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: currencyQuantity,
                    keyboardType: TextInputType.number,
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
                    currencyNameError = null;
                    currencyPriceError = null;
                    currencyQuantityError = null;

                    final String name = currencyName.text.trim();
                    final String priceStr = currencyPrice.text.trim();
                    final String quantityStr = currencyQuantity.text.trim();

                    // Validate all fields and set errors
                    if (name.isEmpty) {
                      currencyNameError = "Currency name cannot be empty.";
                    }
                    if (priceStr.isEmpty || double.tryParse(priceStr) == null) {
                      currencyPriceError = "Please enter a valid price.";
                    }
                    if (quantityStr.isEmpty ||
                        int.tryParse(quantityStr) == null) {
                      currencyQuantityError = "Please enter a valid quantity.";
                    }

                    // If any error exists, setState to update the UI
                    if (currencyNameError != null ||
                        currencyPriceError != null ||
                        currencyQuantityError != null) {
                      setState(() {
                        // Just calling setState here to trigger UI update
                      });
                      return; // Stop further processing
                    }
                    int index =0;
                    index +1;

                    // Proceed with submission if all validations pass
                    String _currencyName = currencyName.text;
                    double price = double.parse(priceStr);
                    double quantity = double.parse(quantityStr);
                    double totalPrice = price * quantity;
                    CurrencyInvestmentDataModel currencyDataModel = CurrencyInvestmentDataModel(investmentId: index, investmentCurrencyName: _currencyName, investmentCurrencyQuantity: quantity, investmentCurrencyPrice: price, investmentCurrencyDatTime: DateTime.now(), investmentTotalPrice: totalPrice);
                    print("Current Index is $index");
                    ProviderData _myProviderKey = context.read<ProviderData>();
                      _myProviderKey.insertingCurrencyDataAtCrypto(widget.cryptoName, currencyDataModel);
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
