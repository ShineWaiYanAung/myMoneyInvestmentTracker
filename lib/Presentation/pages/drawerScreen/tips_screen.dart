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
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjust to fit content height
                children: [
                  Flexible(
                    fit: FlexFit
                        .loose, // Allow child to shrink to its content size
                    child: Text(
                      "I.C.T tracks investment money on Telegram app",
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              padding: EdgeInsets.all(10),
              height: 200,
              width: 100,
              child: buildCurrencyButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return buildDialog(context);
                      },
                    );
                  },
                  path: "asset/investingCurrencyPic/ton.png"),
            ),
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
        width: 100,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildDialog(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xff171719),
      title: Center(
        child: Text(
          "Ton Tipping",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Jersey",
              fontSize: 40),
        ),
      ),
      
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: EdgeInsets.all(10),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "asset/logo/tonQr.jpg", // Replace with your image URL or asset
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: SelectableText(
              "UQB5o3qpQPovBvFfeFrEm4EWTonzf9rnP_BPX52f_Ak5YcpM",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),

          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white), // Set button color to white
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.black), // Set text color to black for contrast
            ),
          ),

        ],
      ),
    );
  }
}
