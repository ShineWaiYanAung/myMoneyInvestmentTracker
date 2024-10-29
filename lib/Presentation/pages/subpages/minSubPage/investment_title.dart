import 'package:flutter/material.dart';

import 'microSubPage/crypto_detail.dart';

class InvestmentTitle extends StatefulWidget {
  const InvestmentTitle({super.key});

  @override
  State<InvestmentTitle> createState() => _InvestmentTitleState();
}

class _InvestmentTitleState extends State<InvestmentTitle> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Card(
                  shadowColor: Colors.white,
                  elevation: 6,
                  color: Color(0xff1C2242),
                  child: ListTile(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CryptoTypeDetail(
                        cryptoName: 'Bits',
                      ),
                    )),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      child: const Text(
                        "1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        "Bits",
                        style: TextStyle(color: Colors.white),
                      ),
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
            }),
      ),
    );
  }
}
