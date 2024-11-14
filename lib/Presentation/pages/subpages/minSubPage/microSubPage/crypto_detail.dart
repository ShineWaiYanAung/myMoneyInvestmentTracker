import 'dart:io';
import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/pages/main_screen.dart';
import 'package:money_investment_track/Presentation/pages/subpages/stack_widget.dart';
import 'package:provider/provider.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/microSubPage/currency_detail_data.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../../../BLOC/funcation_controller.dart';
import '../../../../../DataBase/HiveDataBase/Domain/Crypto/crypto.dart';
import '../../../../widgets/back_button.dart';

class CryptoTypeDetail extends StatefulWidget {
  final String cryptoName;
  final File image;
  const CryptoTypeDetail(
      {super.key, required this.cryptoName, required this.image});

  @override
  State<CryptoTypeDetail> createState() => _CryptoTypeDetailState();
}

class _CryptoTypeDetailState extends State<CryptoTypeDetail> {
  // These totals will be recalculated on every build
  double totalStar = 0.0;
  double totalStarInTon = 0.0;
  double totalTon = 0.0;
  double totalInvestmentData = 0.0;

  @override
  void initState() {
    super.initState();
    // Initially reset values
    resetTotals();
  }

  // Method to reset totals
  void resetTotals() {
    totalStar = 0.0;
    totalStarInTon = 0.0;
    totalTon = 0.0;
    totalInvestmentData = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    // Reset the totals each time the widget rebuilds (this includes when you navigate back)
    resetTotals();

    return Scaffold(
      body: SafeArea(
        child: Consumer<ProviderData>(
          builder: (BuildContext context, ProviderData value, Widget? child) {
            List<Crypto> myCryptoData = value.cryptoInvestedData;

            // Calculate the totals for the selected crypto
            for (var crypto in myCryptoData) {
              if (crypto.cryptoName == widget.cryptoName) {
                if (crypto.currencyInvestmentData?.isNotEmpty ?? false) {
                  for (var investmentData in crypto.currencyInvestmentData!) {
                    // Check if 'Star' or 'Ton' and sum the totals
                    if (investmentData.investmentCurrencyName.toLowerCase() == 'star') {
                      totalStarInTon += investmentData.investmentCurrencyQuantity;
                      totalStar += investmentData.investmentCurrencyQuantity / 0.003167;
                      totalInvestmentData += investmentData.investmentTotalPrice;
                    } else if (investmentData.investmentCurrencyName.toLowerCase() == 'ton') {
                      totalTon += investmentData.investmentCurrencyQuantity;
                      totalInvestmentData += investmentData.investmentTotalPrice;
                    }
                  }
                }
              }
            }

            return ListView(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                      bottomLeft: Radius.circular(70),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BackButtonWidget(
                        isColorChange: true,
                        currencyName: widget.cryptoName, onNavigate: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => StackWidget(),));
                      },
                      ),
                      PieChart(
                        chartRadius: 250,
                        colorList: [Color(0xff099aed), Color(0xfffed008)],
                        chartValuesOptions: const ChartValuesOptions(
                          chartValueStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                        ),
                        animationDuration: const Duration(seconds: 2),
                        dataMap: ChartPercentageCalculator(
                            ton: totalTon, star: totalStarInTon)
                            .percentageResult(),
                        legendOptions: const LegendOptions(
                          showLegends: false, // Set this to false to hide the legend
                        ),
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
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(widget.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildCurrencyData(true, "TON", totalTon.toStringAsFixed(1)),
                                  buildCurrencyData(false, "Star", totalStar.toStringAsFixed(1)),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          // Display the total investment
                          buildTotalCostOfCurrency(totalInvestmentData.toStringAsFixed(1)),
                          SizedBox(height: 20),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCurrencyButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CurrencyDetailData(
                                image: widget.image,
                                currencyName: 'TON',
                                path: "asset/investingCurrencyPic/ton.png",
                                cryptoName: widget.cryptoName,
                              ),
                            ),
                          );
                        },
                        path: "asset/investingCurrencyPic/ton.png"),
                    buildCurrencyButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CurrencyDetailData(
                                image: widget.image,
                                cryptoName: widget.cryptoName,
                                currencyName: 'Star',
                                path: "asset/investingCurrencyPic/star.png",
                              ),
                            ),
                          );
                        },
                        path: "asset/investingCurrencyPic/star.png"),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildCurrencyButton({required VoidCallback onPressed, required String path}) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 160,
        width: 150,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // CurrencyName and Quantity Display
  Widget buildCurrencyData(bool isTon, String currencyName, String currencyAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          child: Text(
            currencyName,
            style: TextStyle(
                color: isTon ? Color(0xff099aed) : Color(0xfffed008),
                fontFamily: "Jersey",
                fontWeight: FontWeight.w500,
                fontSize: 30),
          ),
        ),
        const SizedBox(width: 40),
        Text(
          currencyAmount,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Jersey",
              fontWeight: FontWeight.w500,
              fontSize: 30),
        ),
      ],
    );
  }

  // Total Price of the Currency
  Widget buildTotalCostOfCurrency(String totalAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Total",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Jersey",
              fontWeight: FontWeight.w500,
              fontSize: 40),
        ),
        SizedBox(width: 40),
        Text(
          totalAmount,
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
