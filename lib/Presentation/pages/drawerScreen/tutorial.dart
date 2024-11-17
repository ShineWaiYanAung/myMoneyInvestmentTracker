import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/widgets/back_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/Provider_Data.dart';
class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  bool showNextText = false;
  final Uri _url = Uri.parse('https://www.youtube.com/@adventurequest5210');
  Future<void> _launchYouTube() async {


    try {
      // Check if the URL can be launched
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      } else {
        // Handle case where URL can't be launched
        debugPrint("Could not launch $_url");
      }
    } catch (e) {
      // Handle unexpected exceptions gracefully
      debugPrint("Error occurred while trying to launch URL: $e");
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BackButtonWidget(
              isColorChange: true,
              currencyName: "Tutorial",
              onNavigate: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "Hello Guys",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontFamily: "Jersey",
              ),
            ),
            Center(
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "If you are a beginner and don't know how to transfer or how to buy Ton or USD, even if you don't have an exchanges account?",
                    textStyle: const TextStyle(
                      fontFamily: 'Jersey',
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                isRepeatingAnimation: false,
                onFinished: () {
                  setState(() {
                    showNextText = true;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            if (showNextText)
              const Center(
                child: Text(
                  "Lucky For U ! Our Youtube Channel will teach you step by step for you !!Please Subscribe And level Up to be a pro -_-",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontFamily: "Jersey",
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if(showNextText)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 300,
                  child: InkWell(
                      onTap: _launchYouTube,
                      child: Lottie.asset("asset/jsonAnimation/subscribe.json")),
                ),
              )
          ],
        ),
      ),
    );
  }
}
