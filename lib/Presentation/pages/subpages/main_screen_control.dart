import 'package:flutter/material.dart';
import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/investment_title.dart';

import '../../widgets/componets/tab_bar_item.dart';
import 'minSubPage/chart_widget.dart';

class MainScreenControl extends StatefulWidget {
  const MainScreenControl({
    super.key,
    required this.menuOpacity,
    required this.width,
    required this.height,
    required this.scaffoldKey,
  });

  final double menuOpacity;
  final double width;
  final double height;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  State<MainScreenControl> createState() => _MainScreenControl();
}

class _MainScreenControl extends State<MainScreenControl>
    with SingleTickerProviderStateMixin {
  int selectedTabIndex = 0;


  late AnimationController _controller;
  late Animation<Alignment> _tlAlignAnim;
  late Animation<Alignment> _brAlignAnim;

  @override
  void initState() {
    super.initState();
    // Increase duration to 16 seconds for a slower animation
    _controller =
        AnimationController(duration: Duration(seconds: 20), vsync: this);

    _tlAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _brAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _controller.repeat();
  }

  void onTabTapped(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }
  void onPressDrawer(){
    final scaffold = Scaffold.of(context);
    if (scaffold.isDrawerOpen) return; // Avoid opening if already open
    scaffold.openDrawer();

  }

  @override
  Widget build(BuildContext context) {

    List <Widget> pages = [
      InvestmentDataChart(controller: _controller, tlAlignAnim: _tlAlignAnim, brAlignAnim: _brAlignAnim),
      InvestmentTitle()
    ];
    return SafeArea(
        child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    opacity: widget.menuOpacity,
                    duration: Duration(milliseconds: 2000),
                    child: Container(
                      width: widget.width * 0.2,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.6),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                          onPressDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 50,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: widget.menuOpacity,
                    duration: Duration(milliseconds: 2000),
                    child: Container(
                      width: widget.width * 0.2,
                      height: widget.height * 0.1,
                      decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.6),
                            blurRadius: 3,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {
                         ///SearchEngine
                        },
                        icon: Icon(
                          Icons.search,
                          size: 50,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              pages[selectedTabIndex],
            ],
          ),
        ),
        Positioned(
          bottom: widget.height * 0.1, // Adjust this value if necessary
          left: widget.width * 0.12, // Or use right for more control
          right: widget.width * 0.12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            alignment: Alignment.center,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xff151932),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // This evenly spaces the children
              children: [
                TabBarItem(
                  label: "Chart",
                  isOnTap: selectedTabIndex == 0,
                  onPressed: () => onTabTapped(0),
                ),
                TabBarItem(
                  label: "Invest",
                  isOnTap: selectedTabIndex == 1,
                  onPressed: () => onTabTapped(1),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }
}
