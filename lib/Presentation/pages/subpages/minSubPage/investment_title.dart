import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:provider/provider.dart';

import 'microSubPage/crypto_detail.dart';
import 'package:lottie/lottie.dart';

class InvestmentTitle extends StatefulWidget {
  const InvestmentTitle({super.key});

  @override
  State<InvestmentTitle> createState() => _InvestmentTitleState();
}

class _InvestmentTitleState extends State<InvestmentTitle> {
  @override
  Widget build(BuildContext context) {
    final ProviderData myProviderKey = context.read<ProviderData>();
    return Consumer<ProviderData>(
      builder: (BuildContext context, ProviderData value, Widget? child) {
        final cryptoListTileData = value.cryptoInvestedData;

        return value.cryptoInvestedData.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 88.0),
                  child: Lottie.asset("lottieJson/emptyShow.json"),
                ),
              )
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: ListView.builder(
                      itemCount: cryptoListTileData.length,
                      itemBuilder: (context, index) {
                        int number = index + 1;
                        final eachCryptoTile = cryptoListTileData[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Card(
                            shadowColor: Colors.white,
                            elevation: 6,
                            color: Color(0xff1C2242),
                            child: ListTile(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CryptoTypeDetail(
                                  cryptoName: eachCryptoTile.cryptoName,
                                  image: eachCryptoTile.cryptoImage,
                                ),
                              )),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              leading: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                child: Text(
                                  number.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Center(
                                child: Text(
                                  eachCryptoTile.cryptoName,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              trailing: IconButton(

                                  ///Need To Do
                                  onPressed: () {
                                    myProviderKey.deletingData(eachCryptoTile);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        );
                      }),
                ),
              );
      },
    );
  }
}
