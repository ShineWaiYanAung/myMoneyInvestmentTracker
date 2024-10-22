import 'package:flutter/material.dart';

class TopAppBar extends StatefulWidget {
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
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _tlAlignAnim;
  late Animation<Alignment> _brAlignAnim;

  @override
  void initState() {
    super.initState();
    // Increase duration to 16 seconds for a slower animation
    _controller = AnimationController(duration: Duration(seconds: 20), vsync: this);

    _tlAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _brAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20,top: 10),
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
                      onPressed: () {},
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
                  child: CircleAvatar(
                    radius: widget.width * 0.1,
                    backgroundImage: AssetImage("asset/person/maleStudent.png"),
                  ),
                ),
              ],
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: _tlAlignAnim.value,
                      end: _brAlignAnim.value,

                      colors: [Color(0xff364483), Color(0xff050712)],
                    ),

                    shape: BoxShape.circle,
                  ),
                  width: 400,
                  height: 400,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor

                    ),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total Invest",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "\$5234324",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Dollar",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }
}
