import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/bloc/Provider_Data.dart';
import 'package:money_investment_track/Presentation/pages/subpages/minSubPage/drawer_app.dart';
import 'package:provider/provider.dart';
import 'main_screen_control.dart';

class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidget();
}

class _StackWidget extends State<StackWidget> {
  double topPosition = 0;
  double bottomPosition = 0;
  double menuOpacity = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Track whether the drawer is open or closed
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        topPosition = -200;
        bottomPosition = -100;
        menuOpacity = 1;
      });
    });
  }

  bool isShowNav = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      // Use the onDrawerChanged callback to track drawer state
      onDrawerChanged: (isOpen) {
        setState(() {
          _isDrawerOpen = isOpen;
        });
      },
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
                  width: width,
                  child: Image.asset(
                    "asset/screenAnimate/bottomRectangle.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),

          // Conditionally show MainScreenControl based on drawer state
          if (!_isDrawerOpen)
            MainScreenControl(
              menuOpacity: menuOpacity,
              width: width,
              height: height,
              scaffoldKey: _scaffoldKey,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          final myKey = context.read<ProviderData>();
          myKey.removeOrAddNav();
        },
        child: Consumer<ProviderData>(
          builder: (BuildContext context, ProviderData value, Widget? child) {
            return Icon(
              value.isShow ? Icons.add : Icons.remove,
              size: 40,
              color: Theme.of(context).scaffoldBackgroundColor,
            );
          },
        ),
      ),
    );
  }
}
