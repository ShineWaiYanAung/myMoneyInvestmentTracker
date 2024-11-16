import 'package:flutter/material.dart';

import '../../widgets/back_button.dart';
import '../../widgets/componets/tab_bar_item.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
        child: ListView(
          children: [
            BackButtonWidget(
              isColorChange: true,
              currencyName: 'TIP',
              onNavigate: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjust to fit content height
                children: [
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "I.C.T tracks investment money on Telegram",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "The app is free to use for everyone",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "It don't need internet to use",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "If satisfied with the app’s services",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "you can tip the creator using",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "the resources listed below",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "Whether you tip or not ",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "it's entirely your choice.",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "Have fun farming!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Jersey",
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildCurrencyButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return buildDialog(context);
                        },
                      );
                    },
                    path: "asset/investingCurrencyPic/ton.png"),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2,
                          )
                        ]),
                    padding: EdgeInsets.all(40),
                    child: Text(
                      "K Pay",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
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

  Widget buildDialog(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.network(
                  "https://via.placeholder.com/300", // Replace with your image URL or asset
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  "This is a dialog with an image and a close button.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
