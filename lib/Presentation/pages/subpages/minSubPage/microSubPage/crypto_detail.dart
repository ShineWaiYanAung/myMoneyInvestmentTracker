import 'package:flutter/material.dart';
import 'package:money_investment_track/BLOC/funcation_controller.dart';
import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/microSubPage/currency_detail_data.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../../widgets/back_button.dart';

class CryptoTypeDetail extends StatefulWidget {
  final String cryptoName;
  const CryptoTypeDetail({super.key, required this.cryptoName});

  @override
  State<CryptoTypeDetail> createState() => _CryptoTypeDetailState();
}

class _CryptoTypeDetailState extends State<CryptoTypeDetail> {
  final ChartPercentageCalculator chartPercentageCalculator =
      ChartPercentageCalculator(ton: 10, star: 1700);
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
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackButtonWidget(
                    isColorChange: true,
                    currencyName: widget.cryptoName,
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
                    dataMap: chartPercentageCalculator.percentageResult(),
                    legendOptions: const LegendOptions(
                      showLegends:
                          false, // Set this to false to hide the legend
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
                            color: Colors.blueAccent,
                          ),
                          Column(
                            children: [
                              buildCurrencyData(true, "TON"),
                              buildCurrencyData(false, "Star"),
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
                buildCurrencyButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CurrencyDetailData(),
                        ),
                      );
                    },
                    path: "asset/investingCurrencyPic/ton.png"),
                buildCurrencyButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CurrencyDetailData(),
                        ),
                      );
                    },
                    path: "asset/investingCurrencyPic/star.png"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildCurrencyButton(
      {required VoidCallback onPressed, required String path}) {
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

  //CurrencyNameAndQuantity
  Widget buildCurrencyData(bool isTon, String currencyName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currencyName,
          style: TextStyle(
              color: isTon ? Color(0xff099aed) : Color(0xfffed008),
              fontFamily: "Jersey",
              fontWeight: FontWeight.w500,
              fontSize: 30),
        ),
        const SizedBox(width: 40),
        const Text(
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
