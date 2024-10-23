import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/pages/subpages/stack_widget.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  double topPosition = -100; // Start off-screen for top rectangle
  double bottomPosition = -100; // Start off-screen for bottom rectangle
  double opacity = 0; // Initial opacity for avatar
  double welcomeTextPosition = -200; // Start off-screen from the left
  double nameTextPosition = 1000; // Start off-screen from the right
  double moneyPosition = 1000;
  double coinTopPosition = -100;
  @override
  void initState() {
    super.initState();
    // Trigger animation after the widget is built
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        topPosition = 0; // Move to the top of the screen
        coinTopPosition  =15;
        bottomPosition = 0; // Move to the bottom of the screen
        welcomeTextPosition = MediaQuery.of(context).size.width * 0.05; // Final position for welcome text
        nameTextPosition = MediaQuery.of(context).size.width * 0.26; // Final position for name text
        opacity = 1; // Fade in the avatar
        moneyPosition = MediaQuery.of(context).size.width * 0.65;
      });
    });
    // Navigate after the animations are done
    Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => StackWidget()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                top: topPosition,
                left: 0,
                child: SizedBox(
                  width: width,
                  child: Image.asset(
                    "asset/screenAnimate/topRectangle.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                bottom: bottomPosition,
                left: 0,
                child: SizedBox(
                  child: Image.asset(
                    "asset/screenAnimate/bottomReactangle.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: coinTopPosition,
            child: SizedBox(
              width: 140,
              child: Image.asset(
                "asset/coin.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 800),
              child: Image.asset(
                "asset/human_avator.png",
                width: 400,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: 180,
            left: welcomeTextPosition, // Final position for welcome text
            child: Text(
              "Welcome",
              style: TextStyle(
                fontFamily: 'Jersey',
                fontSize: 80,
                color: Colors.white,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: 120,
            left: moneyPosition, // Final position for name text
            child: Image.asset(
              "asset/money_bag.png",
              width:150,
            ),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            top: 350,
            left: nameTextPosition, // Final position for name text
            child: Text(
              "Shine Wai Yan Aung",
              style: TextStyle(
                fontFamily: 'Jersey',
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
