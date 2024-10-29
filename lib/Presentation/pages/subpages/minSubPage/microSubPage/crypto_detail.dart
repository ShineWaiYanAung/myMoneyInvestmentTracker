import 'package:flutter/material.dart';

import '../../../../widgets/back_button.dart';

class CryptoTypeDetail extends StatefulWidget {
  final String cryptoName;
  const CryptoTypeDetail({super.key, required this.cryptoName});

  @override
  State<CryptoTypeDetail> createState() => _CryptoTypeDetailState();
}

class _CryptoTypeDetailState extends State<CryptoTypeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BackButtonWidget(
                  isColorChange: true,
                  currencyName: widget.cryptoName,
                ),
                CircleAvatar(
                  radius: 100,
                ),
                SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          color: Colors.blueAccent,
                        ),
                        Column(
                          children: [
                            buildCurrenyData(),
                            buildCurrenyData(),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ///TotalPrice
                    buildTotalCostOfCurrency(),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ],
            ),
         ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCurrencyButton(onPressed: () {  }, path: "asset/investingCurrencyPic/ton.png"),
              buildCurrencyButton(onPressed: () {  }, path: "asset/investingCurrencyPic/star.png"),
            ],
          )
        ],
      ),),
    );
  }

  Widget buildCurrencyButton({required VoidCallback onPressed,required String path}) {
    return InkWell(
      onTap: onPressed,
              child: SizedBox(
                height: 160,
                width: 150,
                child: Image.asset(path,fit: BoxFit.cover,),
              ),
            );
  }

  //CurrencyNameAndQuantity
  Widget buildCurrenyData() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Stars",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Jersey",
              fontWeight: FontWeight.w500,
              fontSize: 30),
        ),
        SizedBox(width: 40),
        Text(
          "1000",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Jersey",
              fontWeight: FontWeight.w500,
              fontSize: 30),
        ),
      ],
    );
  }

  //TotalPriceOfTheCurrency
  Widget buildTotalCostOfCurrency() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Stars",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Jersey",
              fontWeight: FontWeight.w500,
              fontSize: 40),
        ),
        SizedBox(width: 40),
        Text(
          "MMK 1000",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Jersey",
              fontWeight: FontWeight.w500,
              fontSize: 30),
        ),
      ],
    );
  }
}
