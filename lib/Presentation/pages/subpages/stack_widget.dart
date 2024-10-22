import 'package:flutter/material.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';

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

  @override
  void initState() {
    super.initState();
    // Trigger animation after the widget is built
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        topPosition =
            -100; // Move to the top of the screencoinTopPosition  =15;
        bottomPosition = -100; // Move to the bottom of the screen
        menuOpacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
        ///Top App Bar
        MainScreenControl(menuOpacity: menuOpacity, width: width, height: height),
      ],
    ));
  }
}

