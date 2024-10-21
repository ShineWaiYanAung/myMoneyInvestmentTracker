import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    super.key,
    required this.menuOpacity,
    required this.width,
    required this.height,
  });

  final double menuOpacity;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedOpacity(
              opacity: menuOpacity,
              duration: Duration(milliseconds: 2000),
              child: Container(
                width: width * 0.2,
                height: height * 0.1,
                decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.6),
                        blurRadius: 3,
                        spreadRadius: 1,
                      ),
                    ]),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.menu,
                      size: 50,
                      color: Colors.white.withOpacity(0.9),
                    )),
              ),
            ),
            AnimatedOpacity(
              opacity: menuOpacity,
              duration: Duration(milliseconds: 2000),
              child: CircleAvatar(
                radius: width * 0.1,
                backgroundImage: AssetImage("asset/person/maleStudent.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
