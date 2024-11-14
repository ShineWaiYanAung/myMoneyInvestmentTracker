import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../bloc/Provider_Data.dart';

class InvestmentDataChart extends StatelessWidget {
  const InvestmentDataChart({
    super.key,
    required AnimationController controller,
    required Animation<Alignment> tlAlignAnim,
    required Animation<Alignment> brAlignAnim,
  }) : _controller = controller, _tlAlignAnim = tlAlignAnim, _brAlignAnim = brAlignAnim;

  final AnimationController _controller;
  final Animation<Alignment> _tlAlignAnim;
  final Animation<Alignment> _brAlignAnim;

  @override
  Widget build(BuildContext context) {
     double totalPrice = 0.0;
    return Consumer<ProviderData>(

      builder: (BuildContext context, ProviderData value, Widget? child) {
        final cryptoData = value.cryptoInvestedData;
        // TODO : Calculating the Total Amount
        for(var eachCryptoData in cryptoData){
          if (eachCryptoData.currencyInvestmentData?.isNotEmpty ?? false){
            for(var eachCurrencyData in eachCryptoData.currencyInvestmentData!){
              totalPrice +=eachCurrencyData.investmentTotalPrice;
            }
        }}

       return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: _tlAlignAnim.value,
                  end: _brAlignAnim.value,
                  colors: [Color(0xff364483), Color(0xff050712)],
                ),
                shape: BoxShape.circle,
              ),
              width: 400,
              height: 400,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor),
                alignment: Alignment.center,
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Invest",
                      style: TextStyle(
                          fontFamily: 'Jersey',
                          color: Colors.white, fontSize: 50),
                    ),
                    SizedBox(height: 40),
                    Text(
                      totalPrice.toStringAsFixed(2),
                      style: TextStyle(
                          fontFamily: 'Jersey',
                          letterSpacing: 1,
                          color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "MMK",
                      style: TextStyle(
                          color: Colors.white, fontSize: 24),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },

    );
  }
}
