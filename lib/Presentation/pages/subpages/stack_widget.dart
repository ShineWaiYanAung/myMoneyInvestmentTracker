import 'package:flutter/material.dart';

import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/drawer_app.dart';

import 'main_screen_control.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidget();
}

class _StackWidget extends State<StackWidget> {
  double topPosition = 0; // Start off-screen for top rectangle
  double bottomPosition = 0; // Start off-screen for bottom rectangle
  double menuOpacity = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Trigger animation after the widget is built
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        topPosition = -100; // Move to the top of the screen
        bottomPosition = -100; // Move to the bottom of the screen
        menuOpacity = 1;
      });
    });

    // Show the drawer after a delay

  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(), // Keep the drawer always in the tree
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
                  width: width, // Ensure to define width for bottom rectangle
                  child: Image.asset(
                    "asset/screenAnimate/bottomRectangle.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          MainScreenControl(
            menuOpacity: menuOpacity,
            width: width,
            height: height,
            scaffoldKey: _scaffoldKey,
          ),
        ],
      ),
    );
  }
}
